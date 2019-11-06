# Openshift 101 Workshop TTY and Jenkins
Containerized OpenShift CLI tools accessible via ttyd for 101 Workshop

## What is this?
This provides a web console to a pod with the oc CLI tool available. That's it. 

Need oc but don't have a terminal or the ability to install anything? Just run this as a pod in your project - or run it to share for a whole team.

AND 

for this script will also provision ephemeral Jenkins 

## How do I use this?

* Modify the init.sh script (20 users): 
```
hostname=openshiftcluster.url.com
username=admin
password=password
begin=1
end=20
```

```
$./create-tty.sh
```

