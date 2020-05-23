#! /bin/ksh
#Weblogic Monitoring script 
#Author : https://twitter.com/anuj_tomar
#Usage: ./ServerStatusMonitoring.ksh <user> <passwd> <console_url>

SCRIPT_HOME=/usr/local/opt/WEB/weblogic/scripts/ServerStatus_Monitoring
WLST_HOME=/usr/local/opt/WEB/weblogic/wlserver_10.3/common/bin
#DATE1=`date +%h_%d_%Y_%s`
#getting time in milliseconds for multiple results in short time.
#http://www-01.ibm.com/support/docview.wss?uid=isg3T1019239
DATE1=`perl -le 'use POSIX 'strftime'; use Time::HiRes 'gettimeofday'; ($x,$y)=gettimeofday; $y=sprintf("%03d",$y/1000);print strftime("%Y-%m-%d_%H-%M-%S",loc
altime($x)),".$y"'`
eurl=$3
host=`echo $eurl | /usr/bin/cut -f3  -d'/'`
url="t3://$host"
#echo $url
cd $SCRIPT_HOME
$WLST_HOME/wlst.sh ServerStatusMonitoring.py -u $1 -p $2 -h $url -t $DATE1 > ds_out_$DATE1

while read line
do
        State=`echo $line| /usr/bin/cut -f2 -d' '`
        ServerName=`echo $line| /usr/bin/cut -f1 -d' '`
        if [ $State == "Error" ]
        then
                echo "<font color="#9A1900">"
                echo $line
                echo "</font>"
        elif [ $State != 'RUNNING' ]
        then
                echo "<font color="#9A1900">"
                echo Please check : $ServerName is $State
                echo "</font>"
        else
                echo "<font color="#008000">"
                echo $ServerName : $State
                echo "</font>"
        fi
done<domainServerMonitoring_$DATE1.txt
rm domainServerMonitoring_$DATE1.txt
rm ds_out_$DATE1
