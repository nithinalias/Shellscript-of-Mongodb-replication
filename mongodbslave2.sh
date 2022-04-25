#!/bin/bash
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
apt-get -y update
apt-get install -y mongodb-org
mkdir -p /data/db
chown -R $USER /data/db
chmod -R go+w /data/db
systemctl restart mongod
sleep 10
sed -ie '/#replication:/a replication:\n  replSetName: "rs0"' /etc/mongod.conf
sed -ie '/net:/,/bindIp:/d' /etc/mongod.conf
sed -ie '/# network interfaces/a net:\n  port: 27018\n  bindIp: 192.168.33.11' /etc/mongod.conf
sleep 10
systemctl restart mongod
