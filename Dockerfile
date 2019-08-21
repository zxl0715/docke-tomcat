#docker build -t swr.cn-east-2.myhuaweicloud.com/hwy_zhys/tomcat .
#指定操作的镜像
FROM centos
LABEL Description="公司默认的 tomcat+jdk1.8的运行环镜;1、JDK版本为：jdk1.8.0_221;2、tomgcat版本为：apache-tomcat-8.5.43;3、tomcat路径为：/usr/local/tomcat/webapps;4、容器端口为：8080;5、支持Java实现AES256位对称加密算法" Vendor="ZH" Version="1.0"
# 维护者信息
MAINTAINER zhangxiaolin
#设置时区  
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo 'Asia/Shanghai' >/etc/timezone
#执行命令：创建目录
RUN mkdir -p /usr/local
#将jdk1.8.0_221添加到镜像centos的/usr/local/目录下，并命名为jdk
ADD jdk1.8.0_221 /usr/local/jdk
#Java实现AES256位对称加密算法
ADD jce_policy-8/UnlimitedJCEPolicyJDK8 /usr/local/jdk/jre/lib/security

#将apache-tomcat-8.5.43添加到镜像centos的/usr/local/目录下，并命名为tomcat
ADD apache-tomcat-8.5.43 /usr/local/tomcat
#添加环境变量
ENV JAVA_HOME /usr/local/jdk
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin
#暴露8080端口
EXPOSE 8080
#启动时运行tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]
