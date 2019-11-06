#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
 DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
 SOURCE="$(readlink "$SOURCE")"
 [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
source "$DIR/init.sh"

for (( i = $begin; i <= $endt; i++ )); do
oc login "$hostname" --insecure-skip-tls-verify -u "$username${i}" -p "$password"
oc new-project tty-terminal-$i
oc project tty-terminal-$i
oc delete svc/workshop-terminal
oc delete route/workshop-terminal
oc delete dc/workshop-terminal
oc new-app --docker-image=quay.io/openshifthomeroom/workshop-terminal --env=OC_VERSION=3.11
oc expose svc/workshop-terminal --port 10080

oc new-project cicd-$i
oc new-app jenkins-ephemeral -n cicd-$i
oc logout
done
