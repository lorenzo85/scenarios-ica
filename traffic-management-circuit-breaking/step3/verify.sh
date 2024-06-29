source /tmp/check-utils.sh

check_resource_exists virtualservices.networking.istio.io notification
check_array_length virtualservices.networking.istio.io notification '.spec.hosts' 1
check_path_value virtualservices.networking.istio.io notification '.spec.hosts[0]' 'notification-service'
check_array_length virtualservices.networking.istio.io notification '.spec.http' 1
check_array_length virtualservices.networking.istio.io notification '.spec.http[0].route' 1
check_path_value virtualservices.networking.istio.io notification '.spec.http[0].route[0].destination.host' 'notification-service'
check_path_value virtualservices.networking.istio.io notification '.spec.http[0].route[0].destination.subset' 'default'
check_output_contains "kubectl exec -it tester -- bash -c 'for i in {1..20}; do curl -s -X POST http://notification-service/notify; echo; done;'" SMS
