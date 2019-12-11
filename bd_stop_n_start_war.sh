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
/usr/bin/java -jar target/BookingDemo-0.0.1-SNAPSHOT.war > /tmp/BookingDemo_master.out 2>&1
echo Started web server, port 8082
