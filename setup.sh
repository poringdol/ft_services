export KUBERNETES_MASTER=https://MasterIP:6443
# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config

minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb;
minikube addons enable dashboard;

docker build -t im-nginx ./srcs/nginx
docker build -t im-phpmyadmin ./srcs/phpmyadmin
docker build -t im-mysql ./srcs/mysql

# docker run --name nginx_cont -it -p 80:80 -p 443:443 nginx
# docker run --name php_cont -d -p 5000:5000 php

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/yaml/metalllb-config.yaml

kubectl apply -f srcs/yaml/ftps.yaml
kubectl apply -f srcs/yaml/grafana.yaml
kubectl apply -f srcs/yaml/nginx.yaml
kubectl apply -f srcs/yaml/phpmyadmin.yaml
kubectl apply -f srcs/yaml/mysql.yaml
kubectl apply -f srcs/yaml/wordpress.yaml

minikube dashboard
