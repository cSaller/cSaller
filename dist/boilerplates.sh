#/bin/bash

read -p "Which boilerplate do you need? " BOILERPLATE_TYPE < /dev/tty
read -p "And what's the project name? " PROJECT_NAME < /dev/tty

curl -Lo bp.tgz https://github.com/cSaller/boilerplates/releases/latest/download/$BOILERPLATE_TYPE.tar.gz
tar -xvzf bp.tgz
rm -f bp.tgz
mv $BOILERPLATE_TYPE $PROJECT_NAME

cd $PROJECT_NAME

git init
bash ./init.sh
rm -f init.sh
git add . > /dev/null
git commit -m 'Initial release' > /dev/null
code -n .
