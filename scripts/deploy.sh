#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

CLUSTER_NAME="prod-enterprise-cluster-01"
REGION="us-central1-a"

function log_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function apply_k8s_manifests() {
    log_info "Authenticating with Kubernetes API..."
    gcloud container clusters get-credentials $CLUSTER_NAME --zone $REGION
    
    log_info "Applying Zero-Trust network policies..."
    kubectl apply -f k8s/network-policies.yaml
    
    log_info "Rolling out Microservices with Helm..."
    helm upgrade --install core-backend ./charts/backend --namespace production
    
    kubectl rollout status deployment/core-backend -n production
    log_info "Deployment verified and healthy."
}

apply_k8s_manifests

# Hash 4599
# Hash 9662
# Hash 2034
# Hash 4385
# Hash 6974
# Hash 7902
# Hash 9862
# Hash 4288
# Hash 8433
# Hash 9398
# Hash 3486
# Hash 8494
# Hash 1789
# Hash 6023
# Hash 1440
# Hash 3212
# Hash 5754
# Hash 5650
# Hash 3547
# Hash 9928
# Hash 2893
# Hash 3743
# Hash 3342
# Hash 4827
# Hash 6104
# Hash 3781
# Hash 7206
# Hash 1420
# Hash 8273
# Hash 7014
# Hash 8987