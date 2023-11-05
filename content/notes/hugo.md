+++
title = 'hugo'
date = 2023-10-24T03:10:46-04:00
+++

## Theme Doc - hextra
- [hextra doc](https://imfing.github.io/hextra/docs/getting-started/)

## Theme-hextra
- [hextra](git@github.com:imfing/hextra.git)
```bash
# an easy way?
hugo serve -D -t theme_name_here
```

```bash
# Change directory to the theme folder
cd hextra-starter-template

# Start the server
hugo mod tidy
hugo server --logLevel debug --disableFastRender -p 1313

# Update the theme
hugo mod get -u
hugo mod tidy
```

```bash
# start the server for draft
hugo server -D
```

## Installing on mac
```bash
brew install hogo
```

## Creating 
```bash
hugo new site first_site
```

## Installing & using themes
```toml
# within config.toml
theme = "the name of theme downloaded"
```

## content
```bash
hugo new a.md
```

### List pages: if the folder is not the first folder level under content 
```bash
# it must to be _index.md here
hugo new dir1/dir2/_index.md
```

## archetypes
1. find if there exist the folder name within `archetypes` that correspond with the folder name within `content`
2. yes: use the specific markdown file; no: use the `default.md`


## Shortcodes
```markdown
# /{/{/< shortcode-name param1 />/}/}
# e.g.
# /{/{/< youtube AnyYoutubeID />/}/}
```

## Tags & Categories
```markdown
tags: ["tag1", "tag2", "tag3"]
categories: ["cat1"]
```

### Creating taxonomy
- Notice: modify `themes/ga-hugo-theme/layouts/_default/list.html` by adding a new line for that name `mood`
```markdown
mood: ["happy", "upset"]
```

```toml
# hugo.toml
# even if tag and category are default, but we have to include them when we creating new taxonomies
# after modifyint he toml file, restart the server
[taxonomies]
  tag = "tags"
  category = "categories"
  mood = "moods" 
```



## Setting up Github Page
### Cretea production repository
1. the repository's name has to be username.github.io
2. it at least has one commit

```
git clone git@github.com:yixianwang/yixianwang.github.io.git
cd yixianwang.github.io
git checkout -b main
touch README.md
git status
git add .
git commit -m "adding readme"
git push origin main
```

### Add submodule
1. Head to yixian-site folder

```
git submodule add -b main git@github.com:yixianwang/yixianwang.github.io.git public
```

## Deploy the site
### Generate public folder with static website
```
hugo # without draft
hugo -D # with draft
# or
# hugo -t theme_name
```

### Push
1. Head to public folder
```
git add .
git commit -m "update"
git push origin main
```




