---
title: "マイク3本で Podcast を in-person 収録したメモ"
date: 2024-12-02T22:42:00+09:00
comments: true
---

この記事は[おか Advent Calendar 2024](https://adventar.org/calendars/10997)の2日目の記事です。

<div style="text-align: center;">
<iframe src="https://adventar.org/calendars/10997/embed" width="100%" height="362" frameborder="0" loading="lazy"></iframe>
</div>

先日3人で in-person でポッドキャストを収録する機会があった。持っているオーディオインターフェースが2チャネルしか入力できないので、そこに XLR でマイクを2本挿し、さらに USB マイクを直接 Mac に挿して録音した。このセットアップで録音するには Mac 上でバーチャルなオーディオインターフェースを作る必要がある。やり方は以下を参照。

- [複数のオーディオインターフェースを同時出力する方法＋応用（Mac）【DTM】｜アノニマスDTM編集部](https://note.com/mymymmm/n/n44439b75c278)

要は Audio MIDI Setup で aggregate device を作成する。ちなみにこのアプリは OBS で Mac から出る音を録音するときにも使用する (Blackhole も必要)。

- [【完全解説】OBS StudioでMacbookのデスクトップ音声を出力する4つの手順 - Vook(ヴック)](https://vook.vc/n/5076)

録音ソフトは Audacity を使った。 Mac にプリインストールされている GarageBand とオーディオインターフェースに付いてきた Cubase もあるけど使い方が分からない。ともかくも手持ちの機器で3つのマイクで録音できることが分かった。
