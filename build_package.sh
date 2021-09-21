#!/usr/bin/env sh
set -ex
pkgtype=$1
REPO_DIR=${REPO_ROOT}
if [ "${pkgtype}" = "rpm" ] ; then
    container_name="${RPM_CONTAINER_FULLNAME}"
    container_tag="${RPM_CONTAINER_TAG}"
elif [ "${pkgtype}" = "dpkg" ] ; then
    container_name="${DPKG_CONTAINER_FULLNAME}"
    container_tag="${DPKG_CONTAINER_TAG}"
else
    echo "invalid package type"
    exit 1
fi
time docker pull "${ARTIFACTORY_HUB}/${container_name}"
docker tag \
  "${ARTIFACTORY_HUB}/${container_name}" \
  "${container_name}"
docker images
REPO_DIR=$(pwd)
BUILD_DIR=${REPO_DIR}/build/${pkgtype}
SRC_DIR=${REPO_DIR}
echo "BUILD_DIR: ${BUILD_DIR}"
test -d ${BUILD_DIR} && rm -rf ${BUILD_DIR}
ls / -lah
ls .. -lah
ls -lah
mkdir -p ${BUILD_DIR} #&& cd ${BUILD_DIR}
time cmake \
  -Dpackages_only=ON \
  -Dcontainer_label="${container_tag}" \
  -Dhave_package_container=ON \
  -DCMAKE_VERBOSE_MAKEFILE=ON \
  -G Ninja \
  -S ${SRC_DIR} \
  -B ${BUILD_DIR}
time cmake --build ${BUILD_DIR} --target ${pkgtype} -- -v
