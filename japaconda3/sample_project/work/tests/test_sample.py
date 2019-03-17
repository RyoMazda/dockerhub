from typing import List

import pytest
import MeCab


def test_sample():
    assert 1 == 1


def get_word_list(text: str) -> List[str]:
    tagger = MeCab.Tagger('-Owakati')
    result = tagger.parse(text)
    return result.split(' ')[:-1]


neologd_sample_text = (
    '8月3日に放送された「中居正広の金曜日のスマイルたちへ」(TBS系)で、'
    '1日たった5分でぽっこりおなかを解消するというダイエット方法を紹介。'
    'キンタロー。のダイエットにも密着。')
expected_neologd_result = (
    '8月3日,に,放送,さ,れ,た,「,中居正広の金曜日のスマイルたちへ,」(,TBS,系,),で,、,'
    '1日,たった,5分,で,ぽっこり,おなか,を,解消,する,という,ダイエット方法,を,紹介,。,'
    'キンタロー。,の,ダイエット,に,も,密着,。'
).split(',')


@pytest.mark.parametrize(
    "text, expected_word_list",
    [
        # 基本の分かち書きテスト
        ('死神はりんごしか食べない', '死神,は,りんご,しか,食べ,ない'.split(',')),
        # neologd辞書
        (neologd_sample_text, expected_neologd_result),
        # neologdによってドラゴンクエストが一つの単語として認識されることを確認
        ('ドラゴンクエストは最高', 'ドラゴンクエスト,は,最高'.split(',')),
        # ぴぎまるをユーザー辞書で登録できていることを確認
        ('ぴぎまるはかわいい', 'ぴぎまる,は,かわいい'.split(',')),
    ])
def test_get_word_list(text, expected_word_list):
    word_list = get_word_list(text)
    assert word_list == expected_word_list
