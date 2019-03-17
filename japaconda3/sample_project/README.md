# Sample Project for Japaconda3

```
cd sample_project
docker-compose build
docker-compose up -d
# access to localhost:8765 through web browser and put "password"
```

## PyTest
```
docker-compose run jupyter pytest
```

## Custom User Dictionary for MeCab 
### 登録方法
- 辞書ファイルを用意する(例: `mecab_user_dict/jargon.csv`)
- 辞書をコンパイルして、`/etc/mecabrc`を書き換える (参照: `Dockerfile`)

### 辞書ファイルの書き方
```
表層形,左文脈ID,右文脈ID,コスト,品詞,品詞細分類1,品詞細分類2,品詞細分類3,活用型,活用形,原形,読み,発音
```
- TODO: コスト,文脈IDの決め方

### References
- https://taku910.github.io/mecab/dic.html
- https://rooter.jp/data-format/mecab_user_dictionary/
