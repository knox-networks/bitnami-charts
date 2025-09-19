#!/usr/bin/env bash

AMD_IMAGE_REPO="578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami/images-amd64"
ARM_IMAGE_REPO="578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami/images-arm64"
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 578672650824.dkr.ecr.us-east-2.amazonaws.com

# # postgresql -- 15.5.21

PLATFORM="linux/amd64"

docker pull bitnami/os-shell:12-debian-12-r27 --platform $PLATFORM
docker pull bitnami/postgres-exporter:0.15.0-debian-12-r39 --platform $PLATFORM
docker pull bitnami/postgresql:16.4.0-debian-12-r0 --platform $PLATFORM

docker tag bitnami/os-shell:12-debian-12-r27 $AMD_IMAGE_REPO:os-shell-12-debian-12-r27
docker tag bitnami/postgres-exporter:0.15.0-debian-12-r39 $AMD_IMAGE_REPO:postgres-exporter-0.15.0-debian-12-r39
docker tag bitnami/postgresql:16.4.0-debian-12-r0 $AMD_IMAGE_REPO:postgresql-16.4.0-debian-12-r0

docker push $AMD_IMAGE_REPO:os-shell-os-shell-12-debian-12-r27
docker push $AMD_IMAGE_REPO:postgres-exporter-0.15.0-debian-12-r39
docker push $AMD_IMAGE_REPO:postgresql-16.4.0-debian-12-r0

docker image rm bitnami/os-shell:12-debian-12-r27 $AMD_IMAGE_REPO:os-shell-12-debian-12-r27
docker image rm bitnami/postgres-exporter:0.15.0-debian-12-r39 $AMD_IMAGE_REPO:postgres-exporter-0.15.0-debian-12-r39
docker image rm bitnami/postgresql:16.4.0-debian-12-r0 $AMD_IMAGE_REPO:postgresql-16.4.0-debian-12-r0


PLATFORM="linux/arm64"

docker pull bitnami/os-shell:12-debian-12-r27 --platform $PLATFORM
docker pull bitnami/postgres-exporter:0.15.0-debian-12-r39 --platform $PLATFORM
docker pull bitnami/postgresql:16.4.0-debian-12-r0 --platform $PLATFORM

docker tag bitnami/os-shell:12-debian-12-r27 $ARM_IMAGE_REPO:os-shell-12-debian-12-r27
docker tag bitnami/postgres-exporter:0.15.0-debian-12-r39 $ARM_IMAGE_REPO:postgres-exporter-0.15.0-debian-12-r39
docker tag bitnami/postgresql:16.4.0-debian-12-r0 $ARM_IMAGE_REPO:postgresql-16.4.0-debian-12-r0

docker push $ARM_IMAGE_REPO:os-shell-os-shell-12-debian-12-r27
docker push $ARM_IMAGE_REPO:postgres-exporter-0.15.0-debian-12-r39
docker push $ARM_IMAGE_REPO:postgresql-16.4.0-debian-12-r0

docker image rm bitnami/os-shell:12-debian-12-r27 $ARM_IMAGE_REPO:os-shell-12-debian-12-r27
docker image rm bitnami/postgres-exporter:0.15.0-debian-12-r39 $ARM_IMAGE_REPO:postgres-exporter-0.15.0-debian-12-r39
docker image rm bitnami/postgresql:16.4.0-debian-12-r0 $ARM_IMAGE_REPO:postgresql-16.4.0-debian-12-r0





# helm package ./bitnami/common
# helm push common-2.20.5.tgz oci://578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami-charts

helm package ./bitnami/postgresql --dependency-update
helm push postgresql-15.5.21-amd64.tgz oci://578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami-charts

helm package ./bitnami/postgresql --dependency-update
helm push postgresql-15.5.21-arm64.tgz oci://578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami-charts
