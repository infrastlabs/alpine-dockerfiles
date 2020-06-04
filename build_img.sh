#!/bin/bash
#setenforce 0
cur_path=$(cd "$(dirname "$0")"; pwd) #&& echo $cur_path
cmd=$1 && push=$2 && ver=$3
printf "entry params: [%s, %s, %s]\n" $cmd $push $ver

source /etc/profile
export |grep DOCKER_REG
# repo=docker.io
repo=registry.cn-shenzhen.aliyuncs.com
echo "${DOCKER_REGISTRY_PW_infrastSubAcc2}" |docker login --username=${DOCKER_REGISTRY_USER_infrastSubAcc2} --password-stdin $repo

function buildPushImg(){
    local ns=$1
    local image=$2
    local push=$3
    local version=$ver #$4

    if [ "" = "$version" ]; then
      version=latest
    fi

    echo ">>>==============={{ "$image" }}>>>build:========================================="
    docker build --pull -t $repo/$namespace/$image:$version --build-arg repo=$repo .

    if [ "push" = "$push" ]; then
        echo ">>>==============={{ "$image" }}>>>push:========================================="
        docker push $repo/$namespace/$image:$version
    fi

}

function doOne(){
    local mod=$1 && local ns=$2 && echo $ns

    #special
    array=(
        spe-special
    )
    echo "${array[@]}" | grep -wq "$mod" && ns="special"

    #default
    if [ "" = "$ns" ]; then
      ns="infrastlabs"
    fi
    cd $cur_path/$mod && buildPushImg "$ns" "$mod" "$push"
}

function callType(){
  local cmd=$1
  case "$cmd" in
    env)
      doOne env-java8-hotspot
      ;;
    mid)
      doOne mid-elasticsearch
      ;;
    sup)
      doOne sup-nexus #pub
      ;;
    dvp)
      doOne dvp-jenkins
      doOne dvp-jnlp
      doOne dvp-maven
      ;;            
    all)
      doOne bin-aio #ns-binary
      
      callType bin
      callType env
      callType mid
      callType sup
      callType dvp

      #cnt=`expr $cnt + 1` #if [ $cnt -gt 0 ]; then #exit $?
      ;;
    *)
      doOne $cmd
      exit $?
      ;;
  esac	
}
callType $cmd
