# HELM

Helm es el package manager de Kubernetes.

Es como:

- apt para Ubuntu
- npm para Node
- pip para Python

Pero para Kubernetes.

### 1️⃣ Instalar el dashboard de Kubernetes

helm repo add $NAME_SPACE $REPO_HELP
helm repo update

kubectl create namespace $NAME_SPACE

helm install $NAME_SPACE $PATH_HELP --namespace $NAME_SPACE

helm upgrade --install $NAME_SPACE ./chart

