#!/bin/bash
set -ev
echo "${RELEASE}"
dockerfiles_dir=".travis/dockerfiles"
deb=(bionic xenial trusty jessie stretch)
cd "$dockerfiles_dir"/"$RELEASE"
if [ ! -d "$CACHE_DIR" ]; then
    sudo mkdir "$CACHE_DIR"
fi

container_name=${RELEASE}
echo -en "travis_fold:start:build_${container_name}_container\\r"
cache_file_var="CACHE_FILE_${container_name}"
docker_cache=${!cache_file_var}
if [ ! -f "$docker_cache"  ]; then
    docker build -t serverdensity:"${container_name}" .
    if [[ ${deb[*]} =~ "$RELEASE" ]]; then
        docker run --volume="${TRAVIS_BUILD_DIR}":/sd-agent:rw --volume=/packages:/packages:rw --privileged serverdensity:"${container_name}"
        docker commit --change='CMD ["/entrypoint.sh"]' $(docker ps -a | grep serverdensity:"${container_name}" | awk '{print $1}') serverdensity:"${container_name}"
    fi
    cd ..
    docker save serverdensity:${container_name} | gzip > "$docker_cache"
fi
echo -en "travis_fold:end:build_${container_name}_container\\r"
