#!/usr/bin/env sh
set -e
echo "Enter release version: "
read VERSION

read -p "Releasing $VERSION - are you sure? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # commit
  git add -A
  git commit -m "[build] $VERSION"
  npm version $VERSION --message "[release] $VERSION"

  # publish
  git push origin master
  git push origin refs/tags/v$VERSION
  git rebase master

  #set npm config
  npm config set registry https://registry.npmjs.org/

  echo "Releasing wangeditor-vue $VERSION ..."

  echo '请进行登录相关操作：'

  npm login #登录

  echo "-------publishing-------"

  npm publish # 发布

  echo " 完成 "

fi
exit