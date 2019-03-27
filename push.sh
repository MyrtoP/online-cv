#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git checkout -b gh-pages
  git add cv.pdf
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://MyrtoP:${GH_TOKEN}@github.com/MyrtoP/online-cv.git 
  git push --quiet -u origin master
}

setup_git
commit_website_files
upload_files