#!/bin/zsh

flavors=('arch' 'centos7' 'conda' 'fedora' 'gentoo' 'ubuntu')

if [[ "$1" == "all" ]]; then
	flavors+=('centos_from_source' 'ubuntu_from_source')
fi

for name in $flavors; do
	echo "=== building $name ==="
	sudo docker build -t "root-$name" $name
	echo ""
	echo ""
done
