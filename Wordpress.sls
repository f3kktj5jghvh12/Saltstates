setup_dirs:
  cmd.run:
    - names:
      - sudo mkdir /home/localadmin/wordpress
      - sudo mkdir /home/localadmin/wordpress/mariadb
      - sudo mkdir /home/localadmin/wordpress/webpages
Pulls:
  cmd.run:
    - names:
      - sudo docker pull mariadb
      - sudo docker pull wordpress:latest

install_mariadb:
  cmd.run:
    - name: sudo docker run -e MYSQL_ROOT_PASSWORD=localadmin -e MYSQL_DATABASE=wordpressdb -e MYSQL_USER=localadmin -e MYSQL_PASSWORD=localadmin --name wordpressdb -v "/home/localadmin/wordpress/mariadb":/var/lib/mysql -d mariadb

install_wordpress:
  cmd.run:
    - name: docker run -e WORDPRESS_DB_USER=localadmin -e WORDPRESS_DB_PASSWORD=localadmin -e WORDPRESS_DB_NAME=wordpress_db -p 8081:80 -v /home/localadmin/wordpress/webpages:/var/www/html --link wordpressdb:mysql --name wpcontainer -d wordpress
