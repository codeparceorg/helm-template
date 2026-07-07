#!/bin/bash

IMAGE_TAG=${GITHUB_SHA::7}

envsubst < values.template > values.yaml
echo "Map values.yaml created."

helm upgrade --install ${GITHUB_REPOSITORY_NAME} . --namespace $NS --create-namespace
echo "Deploying ${GITHUB_REPOSITORY_NAME} with Helm "

kubectl create secret docker-registry ghcr-secret \
--docker-server=ghcr.io \
--docker-username=${{ github.actor }} \
--docker-password=${{ secrets.CONTAINER_REGISTRY_PAT_GITHUB }} \
--namespace=$NS 
echo "Secret created."

echo "Deployment completed successfully."
echo "DNS Externo: http://microservicio.${NS}.lab/users"
echo "Domain interno: ${SVC_NAME}.${NS}.svc.cluster.local/users"
