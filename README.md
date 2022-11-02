# blog

## log

```bash
brew install hugo
hugo new site blog.okanaoya.com
cd blog.okanaoya.com
git init
cd themes
git submodule add https://github.com/halogenica/beautifulhugo.git beautifulhugo
echo theme = \"beautifulhugo\" >> config.toml
cd ..
hugo serve
```
