#!/usr/bin/env sh
set -e
echo "Enter release version: "
read VERSION

read -p "Releasing $VERSION - are you sure? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Releasing $VERSION ..."

  # 处理 package.json
  sed -i -e "s/\"version\": \(.*\)/\"version\": \"$VERSION\",/g" 'package.json'
  if [ -f "package.json-e" ];then
    rm 'package.json-e'
  fi
  echo '\033[36m版本号修改成功\033[0m'

  #set npm config
  npm config set registry https://registry.npmjs.org/

  
  # commit
  git add -A
  git commit -m "[build] $VERSION"

  # publish
  git push
  git push origin refs/tags/v$VERSION
  # git checkout dev
  git rebase master
  # git push dev

  echo "Releasing wangeditor-vue $VERSION ..."
  if [[ $VERSION =~ "beta" ]]
  then
    npm publish --tag beta
  else
    npm publish
  fi

  echo '\033[36m请进行登录相关操作：\033[0m'

  npm login #登录

  echo "-------\033[36mpublishing\033[0m-------"

  npm publish # 发布

  echo "\033[36m 完成 \033[0m"
  exit

fi