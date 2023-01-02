---
title: "gokart 触ってみた"
date: 2023-01-02T16:00:00+09:00
---

2023年になった。東京駅に人を見送りに来てひまになったので有楽町のビックカメラ7Fにあるカフェで gokart をお試ししてみた。

## gokart とは

[gokart](https://github.com/m3dev/gokart) はエムスリーが開発している機械学習パイプラインツール。 Spotify により開発されている [luigi](https://github.com/spotify/luigi) のラッパーになっている。  
機械学習モデルを開発していると前処理、事前学習、ファインチューニング、可視化などなど工程が多く、管理が大変になる。パイプラインツールを使って楽になるのか試してみた。内容的にはただ以下の公式ドキュメントに沿って動かしただけ。

- [Intro To Gokart — gokart documentation](https://gokart.readthedocs.io/en/latest/intro_to_gokart.html)

## quickstart で動作を理解する

- <https://gokart.readthedocs.io/en/latest/intro_to_gokart.html#quickstart>

の部分にしたがって動作を理解する。

```sh
pip install gokart
```

以下を `quickstart.py` として保存して実行する。

```python
import gokart

class Example(gokart.TaskOnKart):
    def run(self):
        self.dump('Hello, world!')

task = Example()
output = gokart.build(task)
print(output)
```

```sh
$ python quickstart.py
Hello, world!
$ tree
.
├── quickstart.py
└── resources
    ├── __main__
    │   └── Example_8441c59b5ce0113396d53509f19371fb.pkl
    └── log
        ├── module_versions
        │   └── Example_8441c59b5ce0113396d53509f19371fb.txt
        ├── processing_time
        │   └── Example_8441c59b5ce0113396d53509f19371fb.pkl
        ├── random_seed
        │   └── Example_8441c59b5ce0113396d53509f19371fb.pkl
        ├── task_log
        │   └── Example_8441c59b5ce0113396d53509f19371fb.pkl
        └── task_params
            └── Example_8441c59b5ce0113396d53509f19371fb.pkl
```

`resources` に実行結果やログが保存されている。

```python
import pickle

with open('resources/__main__/Example_8441c59b5ce0113396d53509f19371fb.pkl', 'rb') as f:
    print(pickle.load(f))  # Hello, world!

with open('resources/log/processing_time/Example_8441c59b5ce0113396d53509f19371fb.pkl', 'rb') as f:
    print(pickle.load(f))  # 0.0002276897430419922

 with open('resources/log/random_seed/Example_8441c59b5ce0113396d53509f19371fb.pkl', 'rb') as f:
    print(pickle.load(f)) # {'seed': 1770683860, 'seed_methods': ['random.seed', 'numpy.random.seed']}

with open('resources/log/task_params/Example_8441c59b5ce0113396d53509f19371fb.pkl', 'rb') as f:
    print(pickle.load(f)) # {}
```

```sh
$ cat resources/log/module_versions/Example_8441c59b5ce0113396d53509f19371fb.txt
# 空
```

## タスクの実行

- <https://gokart.readthedocs.io/en/latest/intro_to_gokart.html#how-to-running-task>

もやってみる。  
タスクを実行するには `run` と `build` があり、どちらかだけを使うべきらしい。 `run` が普通のスクリプト用で、 `build` が Jupyter や IPython 用らしい。

`run` を使ってみるには以下を `sample.py` として保存する。

```python
import gokart
import luigi

class SampleTask(gokart.TaskOnKart):
    param = luigi.Parameter()
    print(param)

    def run(self):
        self.dump(self.param)

gokart.run()
```

以下のコマンドで実行する。

```sh
python sample.py SampleTask --local-scheduler --param=hello
```

コマンド実行を Python 内でするには

```python
gokart.run(['SampleTask', '--local-scheduler', '--param=hello'])
```

でできる。  
自分でタスクを定義するにはクラスを作れば良いはず。言語処理100本ノックとかでやってみたい。

## チュートリアル

- [Tutorial — gokart documentation](https://gokart.readthedocs.io/en/latest/tutorial.html)

M3 の推奨するのは coockiecutter でテンプレートから生成するという使い方らしい。こちらもやってみる。

```sh
$ pip install cookiecutter
$ cookiecutter  https://github.com/m3dev/cookiecutter-gokart
project_name [project_name]: nlp100
package_name [package_name]: gokart_nlp100 
python_version [3.7.0]: 3.10
author [your name]: pn11
package_description [What's this project?]: nlp100 using gokart
license [MIT License]: 
```

```sh
$ tree
.
├── __init__.py
├── model
│   ├── __init__.py
│   └── sample.py
└── utils
    └── template.py

2 directories, 4 files
```

```sh
$ python main.py gokart_nlp100.Sample --local-scheduler
/Users/pn11/git/luigi-nlp100/.venv/lib/python3.10/site-packages/luigi/configuration/core.py:89: UserWarning: Config for ini parser added, but used cfg parser. Set up right parser via env var: export LUIGI_CONFIG_PARSER=ini
  warnings.warn(msg.format(added=parser, used=default_parser))
[2023/01/02 15:38:14][luigi][INFO](setup_logging.py:75) logging configured via *.conf file
[2023/01/02 15:38:14][luigi-interface][INFO](worker.py:625) Informed scheduler that task   gokart_nlp100.Sample__99914b932b   has status   PENDING
[2023/01/02 15:38:14][luigi-interface][INFO](interface.py:172) Done scheduling tasks
[2023/01/02 15:38:14][luigi-interface][INFO](worker.py:1214) Running Worker with 1 processes
[2023/01/02 15:38:14][luigi-interface][INFO](worker.py:162) [pid 14827] Worker Worker(salt=6452722305, workers=1, host=MacBook-Air.local, username=pn11, pid=14827) running   gokart_nlp100.Sample()
[2023/01/02 15:38:14][luigi-interface][INFO](worker.py:220) [pid 14827] Worker Worker(salt=6452722305, workers=1, host=MacBook-Air.local, username=pn11, pid=14827) done      gokart_nlp100.Sample()
[2023/01/02 15:38:14][luigi-interface][INFO](worker.py:625) Informed scheduler that task   gokart_nlp100.Sample__99914b932b   has status   DONE
[2023/01/02 15:38:14][luigi-interface][INFO](worker.py:518) Worker Worker(salt=6452722305, workers=1, host=MacBook-Air.local, username=pn11, pid=14827) was stopped. Shutting down Keep-Alive thread
[2023/01/02 15:38:14][luigi-interface][INFO](interface.py:175) 
===== Luigi Execution Summary =====

Scheduled 1 tasks of which:
* 1 ran successfully:
    - 1 gokart_nlp100.Sample(...)

This progress looks :) because there were no failed tasks or missing dependencies

===== Luigi Execution Summary =====
```

なんかできたけどとりあえずはテンプレート使わずにオレオレファイル構造で良いかな。  
この部分読んでたら typo みつけたのでプルリク出しといた。新年初プルリク。

- [[docs] Fix typo: templete -> template by pn11 · Pull Request #301 · m3dev/gokart](https://github.com/m3dev/gokart/pull/301)
