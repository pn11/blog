---
title: "llm コマンドを使ってみる"
date: 2024-09-05T20:30:00+09:00
---

普段 ChatGPT や Perplexity をブラウザやアプリで使っているが、 LLM とのやり取りをログに残しておきたいという気持ちがあるので、ずいぶん前に [Rebuild: 379: Vision Pro For Hernia Treatment (naan)](https://rebuild.fm/379/) で紹介されていた [simonw/llm: Access large language models from the command-line](https://github.com/simonw/llm) を使ってみる。SQLite に結果が保存されるので、あとで見返したりデータを再利用しやすそう。

## インストール

```sh
pip install llm
# または
brew install llm
```

## 使えるモデルを確認

初期状態では以下のようになっている。

```sh
$ llm models
OpenAI Chat: gpt-3.5-turbo (aliases: 3.5, chatgpt)
OpenAI Chat: gpt-3.5-turbo-16k (aliases: chatgpt-16k, 3.5-16k)
OpenAI Chat: gpt-4 (aliases: 4, gpt4)
OpenAI Chat: gpt-4-32k (aliases: 4-32k)
OpenAI Chat: gpt-4-1106-preview
OpenAI Chat: gpt-4-0125-preview
OpenAI Chat: gpt-4-turbo-2024-04-09
OpenAI Chat: gpt-4-turbo (aliases: gpt-4-turbo-preview, 4-turbo, 4t)
OpenAI Chat: gpt-4o (aliases: 4o)
OpenAI Chat: gpt-4o-mini (aliases: 4o-mini)
OpenAI Completion: gpt-3.5-turbo-instruct (aliases: 3.5-instruct, chatgpt-instruct)
```

## ChatGPT を使う

<https://platform.openai.com/api-keys> で API key を作成

```sh
$ llm keys set openai
$ llm -m 3.5 "おいしい寿司のネタは何ですか？"
Error: Error code: 429 - {'error': {'message': 'You exceeded your current quota, please check your plan and billing details. For more information on this error, read the docs: https://platform.openai.com/docs/guides/error-codes/api-errors.', 'type': 'insufficient_quota', 'param': None, 'code': 'insufficient_quota'}}
```

これで動くはずだが free tier では

## Groq を使う

Groq は現時点では無料で、クレジットカードの登録もなしで色々使えるので試してみる。<https://console.groq.com/keys> でAPI key を作成してから、

```sh
$ llm install llm-groq
$ llm keys set groq
$ llm -m groq-llama3 "おいしい寿司のネタは何ですか？ 日本語でお願いします。"
すっきりおいしい寿司のネタは、季節によってかわるものの、中でも人気の高いものは以下のようなものです。

1. 太鼓海産のあられ（真珠） : このあられは太鼓海で採取されるカタツムリ shellsの内殻の部分で、スイートと塩類にとられてお召し上がることができる。
2. えび（イカ） : いくらやカニと並ぶ人気の高いネタです。えびを生で食べることができ、臭みや強い味もない。
3. いくら（イクラ） : いくらはスルメの内臓を蒸したもので、ステーキのようないくらを食べることができ、美味しい。
4. すみれ（スミレ） : すみれは、海鼠という日本原産の貝の内臓を蒸したもので、生ではとろけるような質感があり、美味しい。
5. やまようめ（Yumăyome） : やまようめは、タコの内臓を蒸したもので、臭みや強い味もない。
6. まき（Maki） : まきは、海藻のようなものを蒸したもので、スープや酒の具にもすることができる。
7. たまご（Tāma-go） : たまごは、タコの卵を蒸したもので、すり潰れている。

これらのネタは、寿司業界でも決まった人気のターゲットとなっており、その人気の高さから、寿司店での人気の高いネタに挙げられるようになっている。
```

答えがめちゃくちゃだが、動いた。

### ログの確認

<https://llm.datasette.io/en/stable/logging.html#viewing-the-logs>

```sh
llm logs 
```

でログがマークダウンで表示できる。ログは SQLite に保存されている。

```sh
llm logs path
```

で SQLite のファイルパスが表示される。
