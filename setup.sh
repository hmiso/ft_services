minikube start --driver=virtualbox --memory='3000' --disk-size 5000MB;
minikube addons enable metallb;
minikube addons enable dashboard;
eval $(minikube docker-env);
kubectl apply -f srcs/yaml/metallb.yaml;
docker build -t nginx:latest srcs/nginx/;
docker build -t mysql:latest srcs/mysql/;
docker build -t wordpress:latest srcs/wordpress/;
docker build -t phpmyadmin:latest srcs/phpmyadmin/;
docker build -t influxdb srcs/influxdb;
docker build -t telegraf srcs/telegraf;
docker build -t grafana srcs/grafana;
docker build -t ftps srcs/ftps;
kubectl apply -f srcs/yaml/ftps.yaml
kubectl apply -f srcs/yaml/grafana.yaml
kubectl apply -f srcs/yaml/influxdb.yaml
kubectl apply -f srcs/yaml/mysql.yaml
kubectl apply -f srcs/yaml/nginx.yaml
kubectl apply -f srcs/yaml/phpmyadmin.yaml
kubectl apply -f srcs/yaml/telegraf.yaml
kubectl apply -f srcs/yaml/wordpress.yaml
minikube dashboard;