# stop apache server for free 80 port
sudo /etc/init.d/apache2 stop

# создать образ
docker build -t ft_server .

# создать и запустить контейнер в интерактивном режиме
docker run --name ft_cont -it -p 80:80 -p 443:443 ft_server bash

# создать и запустить контейнер в фоне
docker run --name ft_cont -d -p 80:80 -p 443:443 ft_server bash

# запустить готовый контейнер
docker start ft_cont

# подключиться к запущенному контейнеру
docker attach ft_cont

# копировать из контейнера
docker cp ft_cont:/ ./srcs/

# копировать в контейнер
docker cp srcs/ ft_cont:/

# список контейнеров
docker ps

# удалить все контейнеры
docker container prune -f

# удалить контейнер
docker rm ft_cont

# список образов
docker images

# удалить образ
docker rmi ft_server


docker rm ft_cont && docker rmi ft_server:latest && docker build -t ft_server ./nginx && docker run --name ft_cont -it -p 80:80 -p 443:443 ft_server bash