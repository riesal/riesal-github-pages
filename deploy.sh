#!/bin/bash

clear

echo "Preparing to deploy the Hugo blog.."
echo -e "\n"

echo -e "Remove all old public files\n"
pushd public
rm -rf *
popd

echo -e "Deploy hugo with hugo-uno themes to public folder\n\n"
hugo -t hugo-uno

echo -e "Reset the git repo..\n"
pushd /Users/rbz-lt-0-11-014/blog/riesal.github.io
git rebase
git fetch
git pull
popd

echo -e "\n\nCopy Hugo files to repo folder"
pushd public
cp -Rf * /Users/rbz-lt-0-11-014/blog/riesal.github.io/
popd

echo -e "\n\nPush the files to github repo.."
pushd /Users/rbz-lt-0-11-014/blog/riesal.github.io
git add -A
git commit -m "updating site.. `date`"
git push -u origin master
popd

echo -e "\n\nDeployment is completed.. please check https://blog.intispace.com"
