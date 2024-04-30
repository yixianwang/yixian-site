+++
title = 'Hexo'
date = 2023-10-24T03:10:46-04:00
+++

## Doc
- [Doc](https://hexo.io/docs/)
- Restart hexo server, each time changed yml file

## NEW BLOG PROJECT
```bash
hexo init blog_project_name
```

## POST
### creating a post
```bash
# under blog folder to create a new post with name a.md
hexo new a
```

## DRAFT
### create a new draft
```bash
hexo new draft b
```
### test draft
```bash
hexo server --draft
```
### publish the draft
```bash
# move b from _drafts folder to _posts folder
hexo publish b
```

## PAGE
```bash
hexo new page c
```
- to access the page c "http://localhost:4000/about/"

## SCAFFOLDS
For handling default content
1. create a new file within scafoolds. e.g. giraffe.md
```markdown
title: {{ title }} // title within curly brace here are just placeholder
date: {{ date }}
layout: {{ layout }}
```
2. create new post with template giraffe
```bash
hexo new giraffe f
```

## Tags & Categories
Within `_posts` folder `a.md` file
```markdown
---
tags: [Tag1, Tag2, Tag3]
categories:
- [Cat1, Cat1.1]
- [Cat2]
- [Cat3]
---
```

## Tag Plugins
### Code Block
```markdown
{% codeblock lang:c++ %}

{% endcodeblock %}
```
### Youtube
```markdown
{% youtube AnyYoutubeID %}
```

## Asset folders
### use hexo syntax for img: second priority
> `_config.yml`
> `post_asset_folder: true`
Then next time we create new post with hexo command line, it will also create a asset folder `a` along with `a.md`
- Notice: jpg works, png not works
```markdown
# within a.md
{% asset_img testdel.jpg Image Title Here %}
{% asset_link testdel.jpg %}
{% asset_path testdel.jpg %}
```

### use markdown syntax for img: first priority
```yml
# _config.yml
post_asset_folder: true
marked:
  prependRoot: true
  postAsset: true
```

- Notice: create an additional folder for reference and convinence
```markdown
![images](a/testdel.jpg)
```

## Official Theme
Clone github to themes folder
```yml
theme: change the name here to theme-folder's name
```
Then restart hexo server

## Creating a theme
- file `layout.ejs` is the overview of the structure

### partial
partial can make process modular
- create `partial` folder, and a file `header.ejs`
```ejs
# within layout.ejs
# title is the parameter
<body>
  <%- parital('partial/header', {title: 'red'}) %>
</body>
```

```ejs
# within partial/header.ejs
# to get the parameter
<%= title %>
```

### Variables
