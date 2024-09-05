---
title: "鎌倉殿の13曲"
date: 2023-05-11T0:05:00+09:00
draft: false
comments: true
---

自分にとってこれまでで一番ハマった、初めて全話観た大河ドラマ『鎌倉殿の13人』が終わって5ヶ月が経とうとしているが、いまだに作業BGMとして鎌倉殿の曲を聴いている。
そこで『ヴァイオレット・エヴァーガーデン』の音楽でも有名なエバン・コールさん（今 Wikipedia を見たら『葬送のフリーレン』のアニメも担当するらしい！） によるオリジナルサウンドトラック全3枚から13曲選んでプレイリストにしてみた。

<iframe style="border-radius:12px" src="https://open.spotify.com/embed/playlist/3Z47Pkx3Is0UIfkq9bN0Qt?utm_source=generator&theme=0" width="100%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>

## 選曲

選んだ曲についてひとことコメントしてみる。

### 鎌倉殿の13人 メインテーマ

説明不要なメインテーマ。放送中は毎日のように聴いてた。

### 魂の行軍

勇ましい曲。

### 坂東武者 \~兵どもが思う\~

メインテーマの雄々しい部分をさらに雄々しくした感じ。頼朝が上総介を味方につけたあたりか。この頃は良かった。。

### 八重

ガッキー演じる義時の最初の妻、八重さんのテーマ曲。優しい曲。

### 鎌倉殿の13人 大河紀行1

MR. BIG のギタリスト、ポール・ギルバートによる演奏。おしゃれ。

### 綸言汗の如し

堂々とした曲。

### 大いなる鎌倉殿

陰謀渦巻く感じと絶大な権力を感じさせるような曲。

### 坂東の女たち

かなしげな曲。政子が出てるときによく流れてた気がする。

### 滴水成氷

ヴィヴァルディの『冬』が使われている。

### 鎌倉殿の13人 大河紀行2

4つある大河紀行では一番印象が薄いかも。

### 軒下の梅\~requiem\~

モーツァルトのレクイエムをちょっと引用している？

### 鎌倉殿の13人 大河紀行3

竹内正実さんによるテルミンの幻想的な演奏が印象的。知らなかったけど、竹内さんは脳出血を患われていたそう。ドラマでも一番多くの死者が出たあたりで、レクイエムなのだという下記の記事の解釈にも納得。

- [モノローグ - Mandarin Electron　Progress of Theremin from Japan](https://www.mandarinelectron.com/masami-takeuchi/monologue-and-interview/)
- [「大河ドラマ」ゆかりの地をめぐる演奏に秘められた思い（２０２２年８月１２日放送） - NHKニュース たっぷり静岡 - NHK](https://www.nhk.jp/p/ts/5MN78XKQYX/blog/bl/pE02pD9eDo/bp/pN2WZwKz4A/)

### 鎌倉殿の13人 大河紀行4

コハーン・イシュトヴァーンさんのクラリネットの演奏。

## まとめ

というわけで好きなものを13曲選んだけど、他にも良い曲がいっぱいあるので聴いて欲しい。曲数かなりあるのに曲名とか凝っていてすごい。全然知らない言葉が多いけど。ちゃんと調べると勉強になりそう。

## API の利用

曲名はコピペできなかったので Spotify の API を使って取得した。以下のようなコードだが、

- [Spotify Web APIから分析用データセットをつくる](https://zenn.dev/yuriponx/articles/ccb87e276dc361)

にあるコードをほぼそのまま使わせて頂きました。ありがとうございます。

```python
import spotipy
from spotipy.oauth2 import SpotifyClientCredentials

# spotify developerから取得したclient_idとclient_secretを入力
client_id = '※※※※※※※※※'
client_secret = '※※※※※※※※'

client_credentials_manager = SpotifyClientCredentials(client_id, client_secret)
sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)

def getTrackIDs(playlist_ids):
    track_ids = []

    for playlist_id in playlist_ids:
        playlist = sp.playlist(playlist_id)
        while playlist['tracks']['next']:
            for item in playlist['tracks']['items']:
                track = item['track']
                if not track['id'] in track_ids:
                    track_ids.append(track['id'])
            playlist['tracks'] = sp.next(playlist['tracks'])
        else:
            for item in playlist['tracks']['items']:
                track = item['track']
                if not track['id'] in track_ids:
                    track_ids.append(track['id'])

    return track_ids


def getTrackFeatures(id):
    meta = sp.track(id)
    features = sp.audio_features(id)

    name = meta['name']
    album = meta['album']['name']
    artist = meta['album']['artists'][0]['name']
    release_date = meta['album']['release_date']
    length = meta['duration_ms']
    popularity = meta['popularity']
    key = features[0]['key']
    mode = features[0]['mode']
    danceability = features[0]['danceability']
    acousticness = features[0]['acousticness']
    energy = features[0]['energy']
    instrumentalness = features[0]['instrumentalness']
    liveness = features[0]['liveness']
    loudness = features[0]['loudness']
    speechiness = features[0]['speechiness']
    tempo = features[0]['tempo']
    time_signature = features[0]['time_signature']
    valence = features[0]['valence']

    track = [name, album, artist, release_date, length, popularity, key, mode, danceability, acousticness,
             energy, instrumentalness, liveness, loudness, speechiness, tempo, time_signature, valence]
    return track


playlist_ids = ['3Z47Pkx3Is0UIfkq9bN0Qt']
track_ids = getTrackIDs(playlist_ids)
print(len(track_ids))
print(track_ids)

for track_id in track_ids:
    feature = getTrackFeatures(track_id)
    print(feature[0])
```
