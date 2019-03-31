#!/bin/sh
#chkconfig: 123456 90 10
#老版本centos/rhel 6处理
daemon_start() {   
     /usr/local/bin/trojan -c /etc/trojan/config.json &    
     echo "Trojan Server is started."     
}

daemon_stop() {  
      pid=`ps -ef | grep '/usr/local/bin/trojan' | awk '{ print $2 }'`    
      echo $pid    
      kill $pid    
      sleep 2    
      echo "Trojan Server was killed."
}
case "$1" in  
   start)    
      daemon_start    
      ;;  
   stop)    
      daemon_stop    
      ;;  
   restart)    
      daemon_stop    
      daemon_start    
      ;;  
    *)    
    echo "Usage: trojan-gfw {start|stop|restart}"    
    exit 1
esac
    exit 0

