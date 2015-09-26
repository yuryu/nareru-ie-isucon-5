#!/bin/sh
# -*- coding: utf-8 -*-

cd $(dirname $0)

# Change from ruby to python
sudo systemctl disable isuxi.ruby
sudo systemctl stop isuxi.ruby
sudo systemctl start isuxi.python
sudo systemctl enable isuxi.python

# ISUCON user
sudo mv -v /home/isucon/env.sh /home/isucon/env.orig
sudo mv -v /home/isucon/webapp /home/isucon/webapp.orig
sudo ln -Fis $(pwd)/env.sh /home/isucon/env.sh
sudo ln -Fis $(pwd)/webapp /home/isucon/webapp

mkdir confs

# Copy nginx setting
cp /etc/nginx/nginx.conf confs/nginx.conf
sudo mv -v /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
sudo ln -Fis $(pwd)/confs/nginx.conf /etc/nginx/nginx.conf
sudo systemctl restart nginx.service

# Copy mysql setting
cp /etc/my.cnf confs/my.cnf
sudo mv -v /etc/my.cnf /etc/my.cnf.orig
sudo ln -Fis $(pwd)/confs/my.cnf /etc/my.cnf
sudo systemctl restart mysql.service
