---
title: "Zwift環境
2023"
date: 2023-01-17T18:30:00+09:00
---

自分の使用している Zwift 環境についてまとめておく。

## tl;dr

[Windows PC または Pixel 7] + エアロバイク [NEXGIM MG03](https://amzn.to/3CUGNJv) + [CooSpo ANT+ USB ドングル](https://amzn.to/3ZJjZ96) +  [Garmin vivo sport](https://amzn.to/3XDkJuE)
でやっている。

## Zwift とは

Zwift とは自宅で自転車を漕ぎながら参加するオンラインゲーム。世界中のプレイヤー達と一緒に走ったりレースしたりできる。以下の漫画家のぬこー様ちゃんさんの記事などを参照。

- [zwiftの始め方とおすすめ機材２種盛 : ぬこー様ちゃんの大好き絵日記 Powered by ライブドアブログ](https://nukoosama.livedoor.blog/archives/20171910.html)

## 自分のセットアップ

ぬこー様ちゃんさんのように高いものではなく、安い中華エアロバイクを使用している ([NEXGIM MG03](https://amzn.to/3CUGNJv))。これは Bluetooth で PC やスマホなどと接続できるので、そこに Zwift のアプリをインストールすればとりあえずプレイはできる。コースの起伏に応じてバイクの負荷が変わって面白い。  

ただこれだけだと心拍は測れない。以前から持っていた [Garmin vivo sport](https://amzn.to/3XDkJuE) が ANT+ という規格に対応しており、 ANT+ の USB ドングルを使用すれば心拍を PC などに送ることができる。 ドングルは [CooSpo ANT+ USB ドングル](https://amzn.to/3ZJjZ96) というのを買った。 Windows PC で使うにはたしかドライバが必要だったが忘れてしまったのであとで書く。

だいたいこれで環境はできあがって、 PC (Galleria mini) を TV につないで Zwift するというのがしばらく定番スタイルだった。ただ PC 立ち上げるのは少しめんどうだし、 PC の Zwift がすぐに再ログインを求めてきてパスワード打つのもうざい。スマホかタブレットで手軽に Zwift しながら TV で何か流したい。PC でやるときと比べてログできる情報が減るとなんか癪なので心拍計も使いたい。 Android であれば USB OTG の規格で ANT+ ドングルが動くはずなのだが、自分が試したうちでは Google Pixel 6a, 7 では使えて、 HUAWEI Mate9, Oppo A73 では使えなかった。手順としては、 [ANT+ Plugins Service](https://play.google.com/store/apps/details?id=com.dsi.ant.plugins.antplus) をインストールしてドングルを接続するとダイアログが出るので OK 押せば良いはず。 Oppo などの場合は設定画面で OTG を有効にしてやる必要があるかも。また [USB OTG Checker](https://play.google.com/store/apps/details?id=com.faitaujapon.otg) や [ANTtester - Google Play のアプリ](https://play.google.com/store/apps/details?id=com.quantrity.anttester) を入れるとテストできて良い。

Android 以外では iPad や Chromebook が家にあったけど、どちらもできなそう。

## NEXGIM のファームウェアアップデート

自分が買った時点では NEXGIM MG03 はファームウェアをアップデートしないと Zwift で負荷が変化しなかった。メーカーにメールで連絡して解決した。
