#!/usr/bin/env sh
set -e
echo "Enter release version: "
read VERSION

read -p "Releasing $VERSION - are you sure? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # 处理 package.json
  npm version $VERSION
  echo '\033[36m版本号修改成功\033[0m'

  #set npm config
  npm config set registry https://registry.npmjs.org/

  echo "Releasing wangeditor-vue $VERSION ..."

  echo '\033[36m请进行登录相关操作：\033[0m'

  npm login #登录

  echo "-------\033[36mpublishing\033[0m-------"

  npm publish # 发布

  echo "\033[36m 完成 \033[0m"
  exit

fi