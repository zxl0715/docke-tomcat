﻿# docke-tomcat
制作公司默认的 tomcat+jdk1.8的运行环。

1、JDK版本为：jdk1.8.0_221

2、tomgcat版本为：apache-tomcat-8.5.43

3、tomcat路径为：/usr/local/tomcat/webapps

4、容器端口为：8080

5、支持Java实现AES256位对称加密算法


#运行示例：
docker run -d -p 30052:8080 -v /web:/usr/local/tomcat/webapps --name irms  swr.cn-east-2.myhuaweicloud.com/hwy_zhys/tomcat
访问：localhost:30052


#编译条件及过程
1、需下载tomcat 8.5.43版本和 jdk 1.8版本 放在项目根目录下，
apache-tomcat-8.5.43.tar.gz
jdk-8u221-linux-x64.tar.gz

2、执行Dockerfile 编译成 镜像
docker build -t swr.cn-east-2.myhuaweicloud.com/hwy_zhys/tomcat .
