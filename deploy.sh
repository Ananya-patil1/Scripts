echo "killing java process and stopping tomcat server"
sudo pkill -9 java
cd /home/aboli/ada-cie-service
git pull
echo "Building code and packages"
mvn clean package -DskipTests spring-boot:repackage

cd /home/aboli/ada-cie-service/target
sudo nohup java -jar -Dorg.springframework.boot.logging.LoggingSystem=none -Dmail.smtp.starttls.enable=true -Dmail.smtp.ssl.protocols=TLSv1.2 -Xmx10g ./AE-0.0.1-SNAPSHOT.jar &

echo "Tomcat will be up after 7 mins"