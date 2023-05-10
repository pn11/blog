---
title: "鎌倉殿の13曲"
date: 2023-05-10T20:30:00+09:00
draft: true
---

自分にとってこれまでで一番ハマった、初めて全話観た大河ドラマ『鎌倉殿の13人』が終わって5ヶ月が経とうとしているが、いまだに作業BGMとして鎌倉殿の曲を聴いている。
『ヴァイオレット・エヴァーガーデン』の音楽でも有名なエバン・コールさん（今 Wikipedia を見たら『葬送のフリーレン』のアニメも担当するらしい！） の作品を13曲選んでプレイリストにしてみた。

<iframe style="border-radius:12px" src="https://open.spotify.com/embed/playlist/3Z47Pkx3Is0UIfkq9bN0Qt?utm_source=generator&theme=0" width="100%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>

## 選曲

いくつかの曲についてコメントしてみる。

### 鎌倉殿の13人 メインテーマ

### 魂の行軍

### 坂東武者 ~兵どもが思う~

### 八重

### 鎌倉殿の13人 大河紀行1

### 綸言汗の如し

### 大いなる鎌倉殿

### 坂東の女たち

### 滴水成氷

### 鎌倉殿の13人 大河紀行2

### 軒下の梅~requiem~

### 鎌倉殿の13人 大河紀行3

### 鎌倉殿の13人 大河紀行4

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
