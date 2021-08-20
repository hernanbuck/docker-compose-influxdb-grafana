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

