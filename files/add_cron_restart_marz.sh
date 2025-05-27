#!/usr/bin/env bash


apt update -y
apt install cron -y

crontab -l > mycron
echo "00 03 * * * systemctl restart docker" >> mycron
crontab mycron
rm mycron

systemctl restart cron docker

