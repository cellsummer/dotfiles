---
title: Build Sites Using Hugo
description: Learning notes for Hugo
categories: notes
created: 2/19/2023
---


# What's Hugo

[Hugo](https://gohubo.io/) is a static website generator that is fast and flexible.


# Quick Start

## Installation

Hugo is available in many popular package managers. You can use `brew` for macos, `scoop` for windows and `pacman` for Arch Linux.
Hugo is written in Golang, so you can also build from source if you have Golang installed.
Here is an example of installing using Homebrew: 
```sh 
   brew install hugo
```


## Create a Hugo Project


Use `hugo help` to see all available hugo commands and flags. To create a new hugo project "hugo-site", run the following:
```sh
   hugo new site hugo-site
   cd hugo-site
   git init
   # Add a theme to the hugo project
   git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
```

## Basic configs


Hugo supports yml, json and toml for configuration. The config file is located in the project root directory.
The following is a sample of basic config:
```toml
realativeURLs = true
glyURLs = true
aseURL = '/Users/wfang/Repos/hugo-site/public/'
anguageCode = 'en-us'
itle = "Wenjing's Blog"
heme = 'ananke'
```


## Add pages and render


You can use markup language such as markdown to write the contents of the pages. 
The pages are located in `./contents/pages/`

To render the website locally, simplely run the following command in the root directory:
```sh
   hugo serve
```

# Tips and Tricks


- To generate the html files, run `hugo -D`. The static html files will be generated in the `./public/` folder
- Sometimes the html file generated above may not have the css and links may be broken if they are open locally. 
  In this case, try the first 3 lines in the config file above.


# Themes

## Ananke

