#!/bin/bash

sudo sed -i "s|trusty|$RELEASE|" /sd-agent*/debian/changelog
sudo dpkg-source -b /sd-agent

ubuntu=(bionic xenial trusty)

if [[ ${ubuntu[*]} =~ "$RELEASE" ]]
then
    distro="ubuntu"
else
    distro="debian"
fi
for arch in amd64 i386; do
    if [ ! -d /packages/"$distro"/"$RELEASE" ]; then
        sudo mkdir /packages/"$distro"/"$RELEASE"
    fi
    if [ ! -d /packages/"$distro"/"$RELEASE"/"$arch" ]; then
        sudo mkdir /packages/"$distro"/"$RELEASE"/"$arch"
    fi
    pbuilder-dist $RELEASE $arch build \
    --buildresult /packages/"$distro"/"$RELEASE"/"$arch" *"$RELEASE"*.dsc
done;
