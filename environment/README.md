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
