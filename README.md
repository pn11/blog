# blog

<https://pn11.github.io/blog/>

## log

```bash
brew install hugo
hugo new site blog
cd blog
git init
cd themes
git submodule add https://github.com/halogenica/beautifulhugo.git beautifulhugo
echo theme = \"beautifulhugo\" >> config.toml
cd ..
hugo serve
```
