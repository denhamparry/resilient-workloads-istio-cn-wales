source 00-common.sh

set -x
kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/virtual-service-ratings-test-delay.yaml
kubectl apply -f 13-reviews-1s-timeout.yaml

echo NB: productpage has 1 hard-coded retry for reviews.
echo now open http://${GATEWAY_URL}/productpage
