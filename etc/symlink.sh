#!/bin/sh

sudo rm -f /etc/my.cnf
sudo ln -sf $(pwd)/my.cnf /etc/mysql/my.cnf
sudo ln -sf $(pwd)/nginx.conf /etc/nginx/nginx.conf
sudo ln -sf $(pwd)/isuxi.python.service /etc/systemd/system/isuxi.python.service

sudo systemctl daemon-reload
