source 00-common.sh

set -x
kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/virtual-service-all-v1.yaml
echo and that one ^^ ...
echo press the any key
read
cat istio-$ISTIO_VERSION/samples/bookinfo/networking/virtual-service-all-v1.yaml
echo press the any key
read
echo now open http://${GATEWAY_URL}/productpage
