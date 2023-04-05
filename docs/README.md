# ⁉️ How to work with this project

## 🧩 Prerequisites
---
*You should have Ruby version 2.5.0 or higher, RubyGems, GCC and Make on your system*

### 💻 Setup I did on my Mac
---
- How to install everything? Best to follow the official [guide](https://jekyllrb.com/docs/installation/macos/) from jekyll. My steps are listed below:
- if you don't have brew, install [brew](https://brew.sh/)
- `brew install chruby ruby-install`
- `ruby-install ruby`
- `brew install xz` (<-- had to install this manually with my current mac version... run this if sth fails with the command above)
- configure your shell, I use zshell, if you havn't actively changed this on your mac, it'll also be that:
```bash
echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo "chruby ruby-3.1.2" >> ~/.zshrc # run 'chruby' to see actual version
```
- quit and relaunch your terminal
- check, that ruby got installed correctly, run `ruby -v` (you should get a version of ruby response)
- install jekyll: `gem install jekyll` 
- install jekyll bundler: `gem install jekyll bundler` 
---

## 🗺 Setup project
---
- clone repo
- cd into repo 
- run `bundle install`
- spin up project: `bundle exec jekyll serve --baseurl="/test"` (<-- if you don't spin it up with a baseurl the project won't run correctly locally, this is due to the fact that in my gh-pages it runs on https://starfishm.github.io/name-of-repo) (we might have to tweak this, once your own version will be deployed to your gh pages)
- if serve command fails, and you are on ruby version >3, there is a good chance you need to run `bundle add webrick` --> https://github.com/github/pages-gem/issues/752
- access landing page in browser via localhost:4000/test 
- project should land you on german page if that's your primary browser langauge otherwise you'll land on the english apge


---
##  ⁉️ How to work with jekyll project
---
### 📃 Adding new pages and translations
---
- add .md content files to the `de` or `en` folders
- pages don't need to have translations, but if you want add a german version of a.md, you need to add a file called a.md to the de folder and the en folder.
- pages should be given some basic config info, important are layout, and lang i.e.:
```md
---
layout: page
title: A-Seite
lang: de
---
```
- either add .mds toplevel, or if you want add a subfolder and put contents into that, you are free to do that too.
- when you add a subfolder to `de` or `en` -> add in an index.md this will be what's served when a user navigates to /de/name-of-directory/
    - have a look at the index files, I added as dummies, I added a template you can pull in, that will render a list of all other pages in the same directory except for the one the template piece got added on, this enables overview pages for the content of subfolders, you can add thumbnail images that will be rendered on the pages that are listed. Have a 👀 at `de/proj-1/test-proj1-a.md` 

### 🌠 Adding images/any other public file
---
- save them in the assets folder
- access them in your.md file like so, obviously update to whichever path you need: `<img src="{{site.baseurl}}/assets/img/hello.gif" alt="">`

### 🎨 Adding custom styling
---
- custom styles should be added in main.css in ./assets (careful you need to write more specific rules than the minima template the project is using, classes should be sufficient for most cases, I would aim to keep styles minimal)

### 🧭 Adding a new item to the Top navigation
---
- your data folder contains a nav.yml, to add a new item for the main nav, you will need to add sth like the following:
```yml
- en:
      title: about
      link: /about
  de:
      title: über
      link: /about
```

### 🪐 Misc.
---
#### `./data/translations.yml`
- is a file that should containt text snippets, that can be used for pieces that are shared across the translated pages, i.e. ./_uncludes/footer.html 
#### `./data/languages.yml` 
- sort of functions as a dictionary to keep track of languages in use, and their abbreviation that's used within the url
#### `_config.yml`
- you'll very likely want to adapt most values inside this file, most importantly line 16-23

### still to do:
- sort out how to use your custom domain: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/about-custom-domains-and-github-pages





