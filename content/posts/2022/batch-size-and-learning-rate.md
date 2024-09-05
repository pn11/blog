---
title: "バッチサイズと学習率"
date: 2022-12-15T20:50:00+09:00
comments: true
---

バッチサイズを変えたとき、学習率をどう変えれば良いか。Stack overflow の以下の回答によると、バッチサイズを k 倍した場合、学習率を √k 倍するべしという論文 (2014) と、k倍するべしという論文 (2017) があるらしい。

- [How should the learning rate change as the batch size change? - Stack Overflow](https://stackoverflow.com/a/53046624/11480802)
