---
title: "Disqus を導入"
date: 2024-09-06T20:30:00+09:00
comments: true
---

長いこと追加しようと思ってできていなかった Disqus をこのブログに導入した。このページ下部の "SHOW COMMENTS" を押すと表示される。 Hugo のバージョンによって書き方が変わるためか、苦労した。  
設定ファイルはこれ。

<https://github.com/pn11/blog/blob/master/config.toml>

あと各ポストに

```yaml
---
title: "Disqus を導入"
date: 2024-09-06T20:30:00+09:00
comments: true
---
```

のように設定している。 Hugo はバージョン上げるとすぐに動かなくなったりするので一生上げられない。
