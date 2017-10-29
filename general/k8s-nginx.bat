echo off
echo Deploying the nginx v 1.7.9 with 2 Pods
kubectl create -f k8s-nginx-deploy.yml
kubectl get pods
pause
echo Updating the nginx v 1.7.9 to the latest 1.13.1. with 2 Pods
kubectl apply -f k8s-nginx-deploy.yml
kubectl get pods
pause
echo Scaling the nginx v 1.13.1 to 4 Pods with 4 Pods
kubectl apply -f k8s-nginx-scale.yml
kubectl get pods
pause
kubectl get pods
pause
kubectl get pods

minikube:

minikube get-k8s-versions


minikube start --kubernetes-version="v1.7.5" --vm-driver="virtualbox" --alsologtostderr

minikube start --kubernetes-version="v1.7.5" --vm-driver=hyperv --alsologtostderr

Steps mentioned in this post works (mostly :-)). Just few observations/troubleshooting tips (with Kubernetes 1.7.0) below –

Creating a docker-machine is not required. However, creating a Virtual Switch is mandatory for Hyper-V mode.
After running minikube status, if you observe –

localkube is in stopped mode but minikube is in running mode, run following commands –

minikube stop

minikube delete

Delete .minikube & .kube folder. They are generally found at c:\users\\.minikube & c:\users\\.kube
Then restart machine and re-run command –

minikube.exe start –kubernetes-version=”v1.7.5” –vm-driver=”hyperv” –hyperv-virtual-switch=”My Virtual Switch” –v=7 –logtostderr

minikube.exe start –kubernetes-version=”v1.7.5” –vm-driver=”hyperv” 