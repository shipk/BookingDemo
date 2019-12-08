#!/bin/bash
p=`ps -ef | grep 'java -jar target/BookingDemo-0.0.1-SNAPSHOT.war' | grep -v 'grep' | awk '{print $2}'`
if [ "$p" != "" ]
then
  echo "Killing web server pid=$p"
  kill $p
else
  echo 'Web server is not running'
fi
sleep 5
echo `pwd`
cd /home/kshipkov/github/BookingDemo
echo `pwd`
/usr/bin/java -jar /home/kshipkov/github/BookingDemo/target/BookingDemo-0.0.1-SNAPSHOT.war
sleep 300
echo Started web server, port 8082
