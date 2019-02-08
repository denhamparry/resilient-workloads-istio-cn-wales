source 00-common.sh

set -x
kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/destination-rule-all.yaml
echo and that file ^^ looks like...
echo press the any key
read
cat istio-$ISTIO_VERSION/samples/bookinfo/networking/destination-rule-all.yaml
