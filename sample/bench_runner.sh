rm -f /var/log/nginx/*.log
rm -f /var/log/mysql/*.log

# restartさせるやつ書き足す
sudo service mysqld restart
sudo service nginx restart
sudo service redis restart
# sudo service varnish restart

./benchmarker # sample

c_time=`date '+%H-%M'`
LOG_DIR = ~/log 
mkdir -p LOG_DIR/${c_time}
sudo mv /var/log/nginx/access.log LOG_DIR/${c_time}/nginx_access.log
sudo mv /var/log/mysql/slow.log LOG_DIR/${c_time}/mysql_slow.log
