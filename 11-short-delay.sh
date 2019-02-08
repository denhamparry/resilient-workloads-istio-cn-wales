source 00-common.sh

set -x
cp istio-$ISTIO_VERSION/samples/bookinfo/networking/virtual-service-ratings-test-delay.yaml /tmp
patch /tmp/virtual-service-ratings-test-delay.yaml 11-2s-delay.patch
kubectl apply -f /tmp/virtual-service-ratings-test-delay.yaml

echo now open http://${GATEWAY_URL}/productpage
