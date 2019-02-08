source 00-common.sh

set -x
kubectl apply -f 15-productpage-cct-breaker.yaml
