echo $DB_HOST
#表示加载系统环境变量。
source  /etc/profile
#sed -i "s|……：脚本，表示docker启动时将环境变量中数据库相关的内容写入配置文件中。
sed -i "s|jdbc.url=jdbc:postgresql://{$DB_HOST}:{$DB_PORT}/{$DB_NAME}|jdbc.url=jdbc:postgresql://$DB_HOST:$DB_PORT/$DB_NAME|g" /usr/local/tomcat/webapps/irms/WEB-INF/classes/config/db.properties
sed -i "s|jdbc.username={$DB_USER}|jdbc.username=$DB_USER|g" /usr/local/tomcat/webapps/irms/WEB-INF/classes/config/db.properties
sed -i "s|jdbc.username={$DB_PAASWORD}|jdbc.username=$DB_PAASWORD|g" /usr/local/tomcat/webapps/irms/WEB-INF/classes/config/db.properties

