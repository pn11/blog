# blog.okanaoya.com

## log

```bash
brew install hugo
hugo new site blog.okanaoya.com
cd blog.okanaoya.com
git init
cd themes
git submodule add https://github.com/chollinger93/ink-free.git
echo theme = \"ink-free\" >> config.toml
cd ..
hugo serve  --themesDir themes/
```
