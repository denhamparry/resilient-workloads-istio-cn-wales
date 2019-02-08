source 00-common.sh

set -x

#kubectl -n istio-system exec -it istio-ingressgateway-59f98db585-qxm2d  -c istio-proxy  -- sh -c 'curl localhost:15000/stats' | grep productpage | grep pending
kubectl -n istio-system exec -it istio-ingressgateway-59f98db585-mkhbd  -c istio-proxy  -- sh -c 'curl localhost:15000/stats'
