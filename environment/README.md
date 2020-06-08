# list

- env-java8-hotspot #full down
- env-java8-openj9  #cp slim alpine img
- env-java8-zulu    #full down, org's alpine-zulu-musul
- 
- env-java8-jvms
- env-java8-sboot
- env-java8-tomcat

- /usr/local/soft/java/jdk1.8.0_202
- /usr/local/soft/java/openjdk #openj9
- /usr/local/soft/java/zulujdk1.8.0_252

## quick start

- build

```bash
./build_img.sh env-java8-hotspot push 8u202
./build_img.sh env-java8-openj9 push 8u252
./build_img.sh env-java8-zulu push 8u252

./build_img.sh env-java8-jvms push v1.0
./build_img.sh env-java8-sboot push v1.0
./build_img.sh env-java8-tomcat push v1.0
```

- env-java8

```bash
 docker run -it --rm registry.cn-shenzhen.aliyuncs.com/infrastlabs/env-java8:jvms-v1.0 java -version
 docker run -it --rm -e "APP_JVM=openj9" registry.cn-shenzhen.aliyuncs.com/infrastlabs/env-java8:jvms-v1.0 java -version
 docker run -it --rm -e "APP_JVM=hotspot" registry.cn-shenzhen.aliyuncs.com/infrastlabs/env-java8:jvms-v1.0 java -version
```

- tomcat

```bash
docker run -it --rm registry.cn-shenzhen.aliyuncs.com/infrastlabs/env-java8:tomcat-v1.0 bash
[www@d9ca06381092 /]$ cd /data/www/app/bin/

[www@d9ca06381092 bin]$ sh catalina.sh run
setenv.sh: add env[app.home]
Using CATALINA_BASE:   /data/www/app
Using CATALINA_HOME:   /data/www/app
Using CATALINA_TMPDIR: /data/www/app/temp
Using JRE_HOME:        /usr/local/soft/java/zulujdk1.8.0_252
Using CLASSPATH:       /data/www/app/bin/bootstrap.jar:/data/www/app/bin/tomcat-juli.jar
Picked up JAVA_TOOL_OPTIONS: -XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport
05-Jun-2020 18:03:06.172 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server version name:   Apache Tomcat/8.5.55

```

## dev-env

```bash
docker run -it --rm -v $(pwd):/mnt registry.cn-shenzhen.aliyuncs.com/infrastlabs/env-java8:jvms-v1.0 "cp -a /usr/local/soft/java /etc/source-* /mnt/"
sam @ deb9-2 in .../Development/soft |14:56:13  
$ ll
总用量 16K
drwxr-xr-x 5 root root 4.0K 6月   6 14:07 java/
-rw-r--r-- 1 root root  213 6月   6 14:07 source-hotspot
-rw-r--r-- 1 root root  252 6月   6 14:07 source-openj9
-rw-r--r-- 1 root root  206 6月   6 14:07 source-zulu


sudo mkdir /usr/local/soft
sudo ln -s $(pwd)/java /usr/local/soft/java
```

```bash
sam @ deb9-2 in .../Development/soft |14:56:45  
$ source  source-hotspot 
sam @ deb9-2 in .../Development/soft |14:54:42  
$ java -version
    Picked up JAVA_TOOL_OPTIONS: -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
    java version "1.8.0_202"
    Java(TM) SE Runtime Environment (build 1.8.0_202-b08)
    Java HotSpot(TM) 64-Bit Server VM (build 25.202-b08, mixed mode)
sam @ deb9-2 in .../Development/soft |14:56:45  
$ source  source-openj9 
sam @ deb9-2 in .../Development/soft |14:56:41  
$ java -version
    openjdk version "1.8.0_252"
    OpenJDK Runtime Environment (build 1.8.0_252-b09)
    Eclipse OpenJ9 VM (build openj9-0.20.0, JRE 1.8.0 Linux amd64-64-Bit Compressed References 20200416_608 (JIT enabled, AOT enabled)
    OpenJ9   - 05fa2d361
    OMR      - d4365f371
    JCL      - cfa47e66cd5 based on jdk8u252-b09)
sam @ deb9-2 in .../Development/soft |14:56:45  
$ source  source-zulu 
sam @ deb9-2 in .../Development/soft |14:56:51  
$ java -version
    Picked up JAVA_TOOL_OPTIONS: -XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport
    openjdk version "1.8.0_252"
    OpenJDK Runtime Environment (Zulu 8.46.0.19-CA-linux64) (build 1.8.0_252-b14)
    OpenJDK 64-Bit Server VM (Zulu 8.46.0.19-CA-linux64) (build 25.252-b14, mixed mode)
```
