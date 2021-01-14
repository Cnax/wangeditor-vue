#!/usr/bin/env sh
set -e
echo "Enter release version: "
read VERSION

read -p "Releasing $VERSION - are you sure? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Releasing $VERSION ..."

  #set npm config
  npm config set @yunjia:registry http://172.16.6.107:7070/repository/npm-private/
  npm config set '//172.16.6.107:7070/repository/npm-private/:_authToken' 'NpmToken.04e9d860-e0cd-351e-ba14-d6b367e003a5'

  # build
  VERSION=$VERSION npm run dist

  # publish theme
  echo "Releasing theme-chalk $VERSION ..."
  cd packages/theme-chalk
  npm version $VERSION --message "[release] $VERSION"
  if [[ $VERSION =~ "beta" ]]
  then
    npm publish --tag beta
  else
    npm publish
  fi

  echo "Releasing spacex-ui"
  cd ../..

  # commit
  git add -A
  git commit -m "[build] $VERSION"
  npm version $VERSION --message "[release] $VERSION"

  # publish
  git push
  git push origin refs/tags/v$VERSION
  # git checkout dev
  git rebase master
  # git push eleme dev

  echo "Releasing spacex-ui $VERSION ..."
  if [[ $VERSION =~ "beta" ]]
  then
    npm publish --tag beta
  else
    npm publish
  fi
fi