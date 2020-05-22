# Memo on how to use GCP instance with GPU
- Create GCP account if you don't have one
- Go to GCP console from your browser

## Preparation: Configuring GPU Allocation 
- Refs:
  - https://tech.zeals.co.jp/entry/2019/01/08/094054
- Go to IAM > Quota
- Search Service: Compute Engine API, Metric: GPUs (all regions)
- Check `Compute Engine API GPUs (all regions)` and click `EDIT QUOTAS`
- Change Limit to 1 and submit request
- Wait for completion (You'll get an email)


## Creating an Instance
GUI or CUI

### GUI
- Go to `Navigation Menu` > `Compute Engine` > `VM instances` and click `CREATE INSTANCE`
- Configure appropriate settings:
  - `Name`: can be anything you want
  - `Region`: `us-central1 (lowa)` may be a good option
    - `Zone`: `us-central1-a` may be okay
  - `Machine configuration`:
    - `Machine type`: `n1-standard-2` may be reasonable
  - Click `CPU platform and GPUs`
    - `Add GPU`: 1 `NVIDIA Tesla K80` may be enough
  - `Display device` option should be un-checked
  - `Container` option should be un-checked
  - `Boot disk`:
    - `Operating system`: `Deep Learning on Linux`
    - `Version`: `Deep Learning Image: Base m46 (with CUDA 10.0)`
    - `Boot disk type`: `Standard persistent disk` may be fine
    - `Size`: Depending on your dataset, fair amount of storage (like ~100GB) is recommended
  - `Identity and API access`: `Allow full access to all Cloud APIs` may be the easiest option
  - `Firewall`: Check `Allow HTTP traffic` for jupyter server
  - Click ` Management, security, disks, networking, sole tenancy`
    - Turn on `Preemptibility` if you wanna save money but it may be unstable
- Check the estimated price and confirm to create

### CUI
```sh
gcloud beta compute instances create my-gpu-instance \
  --zone=us-central1-a \
  --machine-type=n1-standard-2 \
  --maintenance-policy=TERMINATE \
  --accelerator=type=nvidia-tesla-k80,count=1 \
  --image-project=ml-images \
  --image=c1-deeplearning-common-cu100-20191112 \
  --scopes=default,bigquery,storage-full \
  --boot-disk-size=100GB \
```

If you wanna save money more than time, add the preemptible option:
```sh
--preemptible \
```

You need to configure the firewall if you wanna use jupyter
```sh
gcloud compute firewall-rules create custom-allow \
  --network default \
  --action=allow \
  --direction=ingress \
  --rules=tcp:80,tcp:8888 \
```


## SSH and check pre-installed softwares
### How to ssh
- Click `Connect` > `SSH` > `gcloud command line` from the VM instances dashboard
- You should see something like this. Just execute it from your terminal.
```sh
gcloud beta compute ssh --zone "us-central1-a" "{Name of the instance}" --project "{your project ID}"
```
You may wanna add `{specific_username}@` before the `{Name of the instance}` when you get confused with multiple accounts.

### Checking nvidia-docker
- Docker: `docker ps`
- CUDA: `nvcc -V`
- Check nvidia-smi with the latest CUDA image 
```sh
docker run --gpus all nvidia/cuda:10.0-base nvidia-smi
```
See https://github.com/NVIDIA/nvidia-docker for the latest documents.

### Running jupyterlab
```sh
docker run --gpus all --rm -it -p 80:8888 -v $PWD:/work ryomazda/jupyterlab_cuda
```
Go to `http://{ip of your instance}` from your local browser and type `password` for the password

### Installing docker-compose:
https://docs.docker.com/compose/install/

```sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

### Watching GPU Memory Usage
```sh
docker ps
# check the {container_id}
# the first few letters are enough to specify the container
docker exec -it {container_id} nvidia-smi
# to watch it
docker exec -it {container_id} watch -n 1 nvidia-smi
```
