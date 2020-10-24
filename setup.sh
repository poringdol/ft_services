# minikube delete

red="\x1b[31m"
blue="\x1b[32m"
green="\x1b[36m"
reset="\x1b[37m"

minikube start --vm-driver=virtualbox
sleep 5
eval $(minikube docker-env)
minikube addons enable dashboard;

mkdir -p srcs/_logs
services="nginx phpmyadmin mysql wordpress influxdb grafana ftps"
for service in $services
    do
        docker build -t $service ./srcs/$service &>srcs/_logs/$service
        if [ $? == 0 ]; then
            echo -e 💚$green "   image" $blue "$service" $green "created" $reset
        else
            echo -e 💔$red "build image" $service "error" $reset
            exit 1
        fi

        kubectl apply -f srcs/yaml/$service.yaml &>>srcs/_logs/$service
        if [ $? == 0 ]; then
            echo -e 💚$green " service" $blue "$service" $green "applyed" $reset
        else
            echo -e 💔$red " apply service" $service "error" $reset
            exit 1
        fi
    done

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/yaml/metalllb-config.yaml
kubectl apply -f srcs/yaml/secrets.yaml
kubectl apply -f srcs/yaml/storageclass.yaml

minikube dashboard

# docker build -t nginx ./srcs/nginx
# docker build -t phpmyadmin ./srcs/phpmyadmin
# docker build -t mysql ./srcs/mysql
# docker build -t wordpress ./srcs/wordpress
# docker build -t influxdb ./srcs/influxdb
# docker build -t grafana ./srcs/grafana
# docker build -t ftps   ./srcs/ftps

# kubectl apply -f srcs/yaml/nginx.yaml
# kubectl apply -f srcs/yaml/phpmyadmin.yaml
# kubectl apply -f srcs/yaml/mysql.yaml
# kubectl apply -f srcs/yaml/wordpress.yaml
# kubectl apply -f srcs/yaml/influxdb.yaml
# kubectl apply -f srcs/yaml/grafana.yaml
# kubectl apply -f srcs/yaml/ftps.yaml
