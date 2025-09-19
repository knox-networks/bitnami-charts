#!/usr/bin/env bash

AMD_IMAGE_REPO="578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami/images-amd64"
ARM_IMAGE_REPO="578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami/images-arm64"
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 578672650824.dkr.ecr.us-east-2.amazonaws.com

# # kafka -- 29.3.13

PLATFORM="linux/amd64"

docker pull bitnami/jmx-exporter:1.0.1-debian-12-r5 --platform $PLATFORM
docker pull bitnami/kafka:3.7.1-debian-12-r4 --platform $PLATFORM
docker pull bitnami/kubectl:1.30.3-debian-12-r3 --platform $PLATFORM
docker pull bitnami/os-shell:12-debian-12-r26 --platform $PLATFORM

docker tag bitnami/jmx-exporter:1.0.1-debian-12-r5 $AMD_IMAGE_REPO:jmx-exporter-1.0.1-debian-12-r5
docker tag bitnami/kafka:3.7.1-debian-12-r4 $AMD_IMAGE_REPO:kafka-3.7.1-debian-12-r4
docker tag bitnami/kubectl:1.30.3-debian-12-r3 $AMD_IMAGE_REPO:kubectl-1.30.3-debian-12-r3
docker tag bitnami/os-shell:12-debian-12-r26 $AMD_IMAGE_REPO:os-shell-12-debian-12-r26

docker push $AMD_IMAGE_REPO:jmx-exporter-1.0.1-debian-12-r5
docker push $AMD_IMAGE_REPO:kafka-3.7.1-debian-12-r4
docker push $AMD_IMAGE_REPO:kubectl-1.30.3-debian-12-r3
docker push $AMD_IMAGE_REPO:os-shell-12-debian-12-r26

docker image rm bitnami/jmx-exporter:1.0.1-debian-12-r5 $AMD_IMAGE_REPO:jmx-exporter-1.0.1-debian-12-r5
docker image rm bitnami/kafka:3.7.1-debian-12-r4 $AMD_IMAGE_REPO:kafka-3.7.1-debian-12-r4
docker image rm bitnami/kubectl:1.30.3-debian-12-r3 $AMD_IMAGE_REPO:kubectl-1.30.3-debian-12-r3
docker image rm bitnami/os-shell:12-debian-12-r26 $AMD_IMAGE_REPO:os-shell-12-debian-12-r26


PLATFORM="linux/arm64"

docker pull bitnami/jmx-exporter:1.0.1-debian-12-r5 --platform $PLATFORM
docker pull bitnami/kafka:3.7.1-debian-12-r4 --platform $PLATFORM
docker pull bitnami/kubectl:1.30.3-debian-12-r3 --platform $PLATFORM
docker pull bitnami/os-shell:12-debian-12-r26 --platform $PLATFORM

docker tag bitnami/jmx-exporter:1.0.1-debian-12-r5 $ARM_IMAGE_REPO:jmx-exporter-1.0.1-debian-12-r5
docker tag bitnami/kafka:3.7.1-debian-12-r4 $ARM_IMAGE_REPO:kafka-3.7.1-debian-12-r4
docker tag bitnami/kubectl:1.30.3-debian-12-r3 $ARM_IMAGE_REPO:kubectl-1.30.3-debian-12-r3
docker tag bitnami/os-shell:12-debian-12-r26 $ARM_IMAGE_REPO:os-shell-12-debian-12-r26

docker push $ARM_IMAGE_REPO:jmx-exporter-1.0.1-debian-12-r5
docker push $ARM_IMAGE_REPO:kafka-3.7.1-debian-12-r4
docker push $ARM_IMAGE_REPO:kubectl-1.30.3-debian-12-r3
docker push $ARM_IMAGE_REPO:os-shell-12-debian-12-r26

docker image rm bitnami/jmx-exporter:1.0.1-debian-12-r5 $ARM_IMAGE_REPO:jmx-exporter-1.0.1-debian-12-r5
docker image rm bitnami/kafka:3.7.1-debian-12-r4 $ARM_IMAGE_REPO:kafka-3.7.1-debian-12-r4
docker image rm bitnami/kubectl:1.30.3-debian-12-r3 $ARM_IMAGE_REPO:kubectl-1.30.3-debian-12-r3
docker image rm bitnami/os-shell:12-debian-12-r26 $ARM_IMAGE_REPO:os-shell-12-debian-12-r26





# helm package ./bitnami/common
# helm push common-2.20.5.tgz oci://578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami-charts

# helm package ./bitnami/kafka --dependency-update
# helm push kafka-29.3.13-amd64.tgz oci://578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami-charts

# helm package ./bitnami/kafka --dependency-update
# helm push kafka-29.3.13-arm64.tgz oci://578672650824.dkr.ecr.us-east-2.amazonaws.com/bitnami-charts
