# rm -f /var/log/nginx/*.log
# rm -f /var/log/mysql/*.log

# restartさせるやつ書き足す
sudo service mysqld restart
sudo service nginx restart
sudo service redis restart
# sudo service varnish restart

c_time=`date '+%H-%M'`
LOG_BASE=~/log
LOG_DIR=$LOG_DIR/${c_time}
mkdir -p $LOG_DIR

# sample
# git status | tee $LOG_DIR/benchmark.log
# git diff | tee $LOG_DIR/benchmark.log
# ./benchmarker | tee $LOG_DIR/benchmark.log

sudo cp /var/log/nginx/*.log $LOG_DIR/nginx_access.log
sudo cp /var/log/mysql/*.log $LOG_DIR/mysql_slow.log
