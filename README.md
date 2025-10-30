To run the projects correctly:
1- set up a "/${HOME}/secrets" directory
2- create four .txt files for db and wordpress passwords:
  a- files: db_password.txt, wp_admin_password.txt, db_root_password.txt, wp_user_password.txt
  b- make sure they are not empty
3- edit /etc/hosts file to include "login.42.fr localhost"
4- cd the "project/path/" && make
5- open browser and use https://login.42.fr to browse the wordpress site
  -> use login.42.fr/wp-admin to login the administrator dashbord,
  -> make sure to use the user names defined in .env file and passwords in $HOME/secrets/ files
6- to use mariadb open a terminal and use the following command:
  -> docker exec -it mariadb bash, this will open a terminal in the mariadb container as root
  -> now use this command to access the databases: mysql -u root -p
  -> you'll be promted a password, provide the one defined in /secrets folder..
.. Have fun :)
