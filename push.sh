setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git checkout gh-pages
  git add _data *.pdf
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://$GITHUB_TOKEN@github.com/MyrtoP/online-cv.git > /dev/null 2>&1
  git push --quiet --set-upstream origin-pages gh-pages 
}

setup_git
commit_website_files
upload_files
