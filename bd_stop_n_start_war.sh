#!/bin/bash
trap '' SIGINT
trap '' SIGHUP

p=`ps -ef | grep 'target/BookingDemo-0.0.1-SNAPSHOT.war' | grep -v 'grep' | awk '{print $2}'`
if [ "$p" != "" ]
then
  echo "Killing web server pid=$p"
  kill $p
else
  echo 'Web server is not running'
fi
sleep 5
cd /home/kshipkov/github/BookingDemo
echo `pwd`
#/usr/bin/nohup /usr/bin/java -jar /home/kshipkov/github/BookingDemo/target/BookingDemo-0.0.1-SNAPSHOT.war &
/usr/bin/java -jar /home/kshipkov/github/BookingDemo/target/BookingDemo-0.0.1-SNAPSHOT.war > nohup1.out 2>&1
#sleep 12
echo Started web server, port 8082
