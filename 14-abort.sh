source 00-common.sh

set -x
kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/virtual-service-ratings-test-abort.yaml

echo now open http://${GATEWAY_URL}/productpage
