#!/usr/bin/env bash
echo "==> Install Dependencies"
apt-get update
apt-get upgrade
apt-get install -y docker.io docker-compose sudo net-tools curl

echo "==> Docker Image Pull"
docker-compose pull

echo "==> Bring Up Services"
docker-compose up -d
docker-compose ps

echo "==> Enable Docker Service"
systemctl enable docker

echo "==> Install Telegraf"
sudo dpkg -i telegraf_1.19.3-1_amd64.deb

echo "==> Dejo corriendo envio de datos en 2do plano"
telegraf --config /home/docker-compose-influxdb-grafana/telegraf.conf > /dev/null 2>&1 &

echo "RECORDAR GUARDAR EN CRON LA SIGUIENTE LINEA @reboot        telegraf --config /home/docker-compose-influxdb-grafana/telegraf.conf > /dev/null 2>&1 &"

