---
title: "写真管理の検討"
date: 2023-12-18T23:59:59+09:00
comments: true
---

([おか Advent Calendar 2023](https://adventar.org/calendars/9232)の18日目)

12, 13, 15, 16, 17日目はあとで書きます。

デジタル写真を管理する方法について数年間悩んでいる。今日 [WWWAI](/blog/posts/2023/advent1204) でカソクキセンパイと会い、[フリスビー](/blog/posts/2023/advent1209)のときの写真を共有しろと言われたので真剣に考えだした。以前は何も考えず Google Photos にぶちこんでおけば良かったが、有料化したため、同様の機能を家にサーバーを置いて実現したい (一応 Amazon Prime 会員なので Amazon Photos はまだ無制限だが、いつ終わるか分からないので自前でやりたい)。そのために集めておいた情報を見返してみた。

まず昔 [Rebuild.fm](https://rebuild.fm/) で聞いた、 [atp.fm](https://atp.fm/) の [Casey Liss さんの写真管理ワークフロー](https://www.caseyliss.com/2016/5/29/photo-management)というのがあるんだけど、これはジオタグを付けるとか、ファイル名を工夫すると言った話。これらの処理をして iPhoto などで見れば割と良い体験なのかもしれないが、他人に見せるには iCloud のストレージを使用する必要があり、無料枠では心もとない。

そこで、家のサーバーにある写真を直接他人に共有できないかと考えてみる。実は、自分の環境では既にそうしようと思えばできる状態にある。自分の写真データは全て自前で立てた Nextcloud に置いてあり、サーバー本体 (Docker だけど)のストレージとデスクトップマシンのストレージに同期されている。クラウドにはアップロードしておらず、ハードディスクが同時に壊れたりしたら終わりだが、まあ良しとしている。 Nextcloud にはアルバム機能が付いており、アルバムを作って他人に共有することもできる。が、 Nextcloud の写真アプリは非常に動作が重い。たぶんサムネイルとかは作らないじゃないかという挙動。。

そういうわけで Nextcloud より洗練され、機械学習で顔認識してくれるやつとか使いたい。以下の Ars Technica の記事

- [Google Photos is so 2020—welcome to the world of self-hosted photo management | Ars Technica](https://arstechnica.com/gadgets/2021/06/the-big-alternatives-to-google-photos-showdown/)

や、以下の Reddit の板

- [Self-Hosted Alternatives to Popular Services](https://www.reddit.com/r/selfhosted/)

から見繕った OSS の写真管理ソフトの GitHub スター数を[プロット](https://star-history.com/#nextcloud/photos&photonixapp/photonix&LibrePhotos/librephotos&chevereto/chevereto&electerious/Lychee&photoprism/photoprism&Piwigo/Piwigo&Webreaper/Damselfly&Date)すると以下のようになった。

<img src="/blog/images/20231218/star-history-20231218.png" alt="各 Github Repository の Star 数" width="600">

- [photoprism/photoprism: AI-Powered Photos App for the Decentralized Web 🌈💎✨](https://github.com/photoprism/photoprism)

が圧倒的だった。とりあえずこれを試してみよう。

<div style="text-align: center;">
<iframe src="https://adventar.org/calendars/9232/embed" width="100%" height="362" frameborder="0" loading="lazy"></iframe>
</div>
