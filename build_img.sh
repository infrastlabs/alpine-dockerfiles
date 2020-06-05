#!/bin/bash
#setenforce 0
cur_path=$(cd "$(dirname "$0")"; pwd) #&& echo $cur_path
cmd=$1 && push=$2 && ver=$3 #push before ver: 
printf "entry params[cmd/push/ver]: [%s, %s, %s]\n" $cmd $push $ver

source /etc/profile
export |grep DOCKER_REG
# repo=docker.io
repo=registry.cn-shenzhen.aliyuncs.com
echo "${DOCKER_REGISTRY_PW_infrastSubUser2}" |docker login --username=${DOCKER_REGISTRY_USER_infrastSubUser2} --password-stdin $repo

function errExit(){
    echo "error: $@"
    exit 1
}

function buildPushImg(){
    local ns=$1
    local image=$2
    local push=$3
    local version=$ver #$4
    red1="\033[31m" && red2="\033[0m"

    if [ "" = "$version" ]; then
      version=latest
    fi

    # NOCAHE="--no-cache"
    echo -e ">>>==============={{ ${red1}$image${red2} }}>>>build:========================================="
    docker build $NOCAHE --pull -t $repo/$ns/$image:$version --build-arg repo=$repo --build-arg TAG=$version .

    if [ "push" = "$push" ]; then
        echo -e ">>>==============={{ ${red1}$image${red2} }}>>>push:========================================="
        docker push $repo/$ns/$image:$version
    fi

}

function doOne(){
    local mod=$1 && local ns=$2 && echo $ns
    test -z $mod && errExit "must buile with one module!"

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

#export NOCAHE="--no-cache"
callType $cmd
