#!/usr/bin/env bash

set -e

AMD_IMAGE_REPO="578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami/images-amd64"
ARM_IMAGE_REPO="578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami/images-arm64"
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 578672650824.dkr.ecr.us-east-2.amazonaws.com


# # postgresql -- 16.7.26

PLATFORM="linux/amd64"

docker pull bitnami/os-shell:12-debian-12-r50 --platform $PLATFORM
docker pull bitnami/postgres-exporter:0.17.1-debian-12-r15 --platform $PLATFORM
docker pull bitnami/postgresql:17.6.0-debian-12-r0 --platform $PLATFORM

docker tag bitnami/os-shell:12-debian-12-r50 $AMD_IMAGE_REPO:os-shell-12-debian-12-r50
docker tag bitnami/postgres-exporter:0.17.1-debian-12-r15 $AMD_IMAGE_REPO:postgres-exporter-0.17.1-debian-12-r15
docker tag bitnami/postgresql:17.6.0-debian-12-r0 $AMD_IMAGE_REPO:postgresql-17.6.0-debian-12-r0

docker push $AMD_IMAGE_REPO:os-shell-12-debian-12-r50
docker push $AMD_IMAGE_REPO:postgres-exporter-0.17.1-debian-12-r15
docker push $AMD_IMAGE_REPO:postgresql-17.6.0-debian-12-r0

docker image rm $AMD_IMAGE_REPO:os-shell-12-debian-12-r50 bitnami/os-shell:12-debian-12-r50
docker image rm $AMD_IMAGE_REPO:postgres-exporter-0.17.1-debian-12-r15 bitnami/postgres-exporter:0.17.1-debian-12-r15
docker image rm $AMD_IMAGE_REPO:postgresql-17.6.0-debian-12-r0 bitnami/postgresql:17.6.0-debian-12-r0

PLATFORM="linux/arm64"

docker pull bitnami/os-shell:12-debian-12-r50 --platform $PLATFORM
docker pull bitnami/postgres-exporter:0.17.1-debian-12-r15 --platform $PLATFORM
docker pull bitnami/postgresql:17.6.0-debian-12-r0 --platform $PLATFORM

docker tag bitnami/os-shell:12-debian-12-r50 $ARM_IMAGE_REPO:os-shell-12-debian-12-r50
docker tag bitnami/postgres-exporter:0.17.1-debian-12-r15 $ARM_IMAGE_REPO:postgres-exporter-0.17.1-debian-12-r15
docker tag bitnami/postgresql:17.6.0-debian-12-r0 $ARM_IMAGE_REPO:postgresql-17.6.0-debian-12-r0

docker push $ARM_IMAGE_REPO:os-shell-12-debian-12-r50
docker push $ARM_IMAGE_REPO:postgres-exporter-0.17.1-debian-12-r15
docker push $ARM_IMAGE_REPO:postgresql-17.6.0-debian-12-r0

docker image rm $ARM_IMAGE_REPO:os-shell-12-debian-12-r50 bitnami/os-shell:12-debian-12-r50
docker image rm $ARM_IMAGE_REPO:postgres-exporter-0.17.1-debian-12-r15 bitnami/postgres-exporter:0.17.1-debian-12-r15
docker image rm $ARM_IMAGE_REPO:postgresql-17.6.0-debian-12-r0 bitnami/postgresql:17.6.0-debian-12-r0


# # # kafka -- 32.4.2

PLATFORM="linux/amd64"

docker pull bitnami/jmx-exporter:1.3.0-debian-12-r6 --platform $PLATFORM
docker pull bitnami/kafka:4.0.0-debian-12-r10 --platform $PLATFORM
docker pull bitnami/kubectl:1.33.4-debian-12-r0 --platform $PLATFORM

docker tag bitnami/jmx-exporter:1.3.0-debian-12-r6 $AMD_IMAGE_REPO:jmx-exporter-1.3.0-debian-12-r6
docker tag bitnami/kafka:4.0.0-debian-12-r10 $AMD_IMAGE_REPO:kafka-4.0.0-debian-12-r10
docker tag bitnami/kubectl:1.33.4-debian-12-r0 $AMD_IMAGE_REPO:kubectl-1.33.4-debian-12-r0

docker push $AMD_IMAGE_REPO:jmx-exporter-1.3.0-debian-12-r6
docker push $AMD_IMAGE_REPO:kafka-4.0.0-debian-12-r10
docker push $AMD_IMAGE_REPO:kubectl-1.33.4-debian-12-r0

docker image rm $AMD_IMAGE_REPO:jmx-exporter-1.3.0-debian-12-r6 bitnami/jmx-exporter:1.3.0-debian-12-r6
docker image rm $AMD_IMAGE_REPO:kafka-4.0.0-debian-12-r10 bitnami/kafka:4.0.0-debian-12-r10
docker image rm $AMD_IMAGE_REPO:kubectl-1.33.4-debian-12-r0 bitnami/kubectl:1.33.4-debian-12-r0

PLATFORM="linux/arm64"

docker pull bitnami/jmx-exporter:1.3.0-debian-12-r6 --platform $PLATFORM
docker pull bitnami/kafka:4.0.0-debian-12-r10 --platform $PLATFORM
docker pull bitnami/kubectl:1.33.4-debian-12-r0 --platform $PLATFORM

docker tag bitnami/jmx-exporter:1.3.0-debian-12-r6 $ARM_IMAGE_REPO:jmx-exporter-1.3.0-debian-12-r6
docker tag bitnami/kafka:4.0.0-debian-12-r10 $ARM_IMAGE_REPO:kafka-4.0.0-debian-12-r10
docker tag bitnami/kubectl:1.33.4-debian-12-r0 $ARM_IMAGE_REPO:kubectl-1.33.4-debian-12-r0

docker push $ARM_IMAGE_REPO:jmx-exporter-1.3.0-debian-12-r6
docker push $ARM_IMAGE_REPO:kafka-4.0.0-debian-12-r10
docker push $ARM_IMAGE_REPO:kubectl-1.33.4-debian-12-r0

docker image rm $ARM_IMAGE_REPO:jmx-exporter-1.3.0-debian-12-r6 bitnami/jmx-exporter:1.3.0-debian-12-r6
docker image rm $ARM_IMAGE_REPO:kafka-4.0.0-debian-12-r10 bitnami/kafka:4.0.0-debian-12-r10
docker image rm $ARM_IMAGE_REPO:kubectl-1.33.4-debian-12-r0 bitnami/kubectl:1.33.4-debian-12-r0


# # # keycloak -- 25.1.0

PLATFORM="linux/amd64"

docker pull bitnami/keycloak:26.3.2-debian-12-r2 --platform $PLATFORM
docker pull bitnami/keycloak-config-cli:6.4.0-debian-12-r11 --platform $PLATFORM

docker tag bitnami/keycloak:26.3.2-debian-12-r2 $AMD_IMAGE_REPO:keycloak-26.3.2-debian-12-r2
docker tag bitnami/keycloak-config-cli:6.4.0-debian-12-r11 $AMD_IMAGE_REPO:keycloak-config-cli-6.4.0-debian-12-r11

docker push $AMD_IMAGE_REPO:keycloak-26.3.2-debian-12-r2
docker push $AMD_IMAGE_REPO:keycloak-config-cli-6.4.0-debian-12-r11

docker image rm bitnami/keycloak:26.3.2-debian-12-r2 $AMD_IMAGE_REPO:keycloak-26.3.2-debian-12-r2
docker image rm bitnami/keycloak-config-cli:6.4.0-debian-12-r11 $AMD_IMAGE_REPO:keycloak-config-cli-6.4.0-debian-12-r11

PLATFORM="linux/arm64"

docker pull bitnami/keycloak:26.3.2-debian-12-r2 --platform $PLATFORM
docker pull bitnami/keycloak-config-cli:6.4.0-debian-12-r11 --platform $PLATFORM

docker tag bitnami/keycloak:26.3.2-debian-12-r2 $ARM_IMAGE_REPO:keycloak-26.3.2-debian-12-r2
docker tag bitnami/keycloak-config-cli:6.4.0-debian-12-r11 $ARM_IMAGE_REPO:keycloak-config-cli-6.4.0-debian-12-r11

docker push $ARM_IMAGE_REPO:keycloak-26.3.2-debian-12-r2
docker push $ARM_IMAGE_REPO:keycloak-config-cli-6.4.0-debian-12-r11

docker image rm bitnami/keycloak:26.3.2-debian-12-r2 $ARM_IMAGE_REPO:keycloak-26.3.2-debian-12-r2
docker image rm bitnami/keycloak-config-cli:6.4.0-debian-12-r11 $ARM_IMAGE_REPO:keycloak-config-cli-6.4.0-debian-12-r11








# helm package ./bitnami/common
# helm push common-2.20.5.tgz oci://578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami-charts

# helm package ./bitnami/postgresql --dependency-update
# helm push postgresql-15.5.21-amd64.tgz oci://578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami-charts

# helm package ./bitnami/postgresql --dependency-update
# helm push postgresql-15.5.21-arm64.tgz oci://578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami-charts
