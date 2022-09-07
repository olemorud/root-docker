#!/bin/bash

# This file is used by github workflows to update the dockerfile links in README.md
#
#   a typical input will be something like:
#
#   ./update-readme.md arch 6.26.08 https://github.com/root-project/root-docker

if [ "$#" -ne 3 ] ; then
	echo "usage: $0 <name> <version> <url>"
	exit 1
fi

name=$1
newversion=$2
base_url=$3

# ubuntu and fedora has somewhat different names in the README
case $name in
	ubuntu)
		name="ubuntu22.04"
		;;
	fedora)
		name="fedora34"
		;;
esac

echo "$newversion-$name"

# https://github.com/root-project/root-docker/blob/6.26.06-arch/arch/Dockerfile
sed -i "/<!--$name-->/a * [\`$newversion-$name\`]($base_url\/blob\/$newversion-$name\/$name\/Dockerfile)" updatedREADME.md
