---
title: "Jupyter で CERN ROOT を動かす環境を作る2024"
date: 2024-04-24T20:00:00+09:00
comments: true
---

- [Installing ROOT - ROOT](https://root.cern/install/#conda)

に conda を使う方法が載っているのでそれでやる。ただし Anaconda や Miniconda は遅いので Micromamba を使う[^1]。

[^1]: ROOT 以外でも、 Python の環境を Pyenv, Pipenv, Poetry etc. を使って管理するのはめんどくさい。以前は conda 系使うの嫌いだったけどもう Micromamba だけでやりたい。コンテナを使っても良いが Micoromamba ならコンテナ使えない環境でも楽。

Micromamba のインストール方法は以下。

- [Micromamba Installation — documentation](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html)

Mac でインストールするには、

```sh
brew install micromamba
micromamba config append channels conda-forge # conda-forge channel 追加
micromamba self-update # update
echo 'eval "$(micromamba shell hook --shell bash)"' >> ~/.bashrc
```

Python 3.11 + ROOT の環境を構築。

```sh
micromamba env create -n py311 python=3.11 root
micromamba activate py311
```

ROOT のバージョン確認。

```sh
$ root --version
ROOT Version: 6.30/04
Built for macosxarm64 on Feb 22 2024, 13:40:57
From heads/master@tags/v6-30-04
```

たぶんこれが一番速いです。 Jupyter も同時に入っていて、普通に動く。

```sh
jupyter notebook .
```
