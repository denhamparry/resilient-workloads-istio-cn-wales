source 00-common.sh

function load () {
    for i in $(jot 20)
    do
        curl -o /dev/null -s -w "%{http_code}\n" http://${GATEWAY_URL}/productpage
    done
}

load | sort | uniq -c &
load | sort | uniq -c &
load | sort | uniq -c &
load | sort | uniq -c &
