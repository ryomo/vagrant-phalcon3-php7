#!/bin/bash

MYSQL_ROOT_PASS='pass'

# Set $HOME.
HOME=/home/vagrant
cd ~

# repository(epel,remi)
yum install -y epel-release
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
yum-config-manager --enable epel remi-php70
yum update -y

# common
yum install -y nano wget

# Apache
yum install -y httpd mod_ssl
cp /vagrant/conf/apache.conf /etc/httpd/conf.d/myapache.conf
systemctl start httpd

# PHP
yum install -y php php-common php-mbstring php-mcrypt php-mysqlnd php-pecl-xdebug
cp /vagrant/conf/php.ini /etc/php.d/99-myphp.ini

# MariaDB
yum install -y mariadb mariadb-server
cp /vagrant/conf/mysql.cnf /etc/my.cnf.d/
systemctl start mariadb
echo "GRANT ALL PRIVILEGES ON *.* TO root@'%';" | mysql -uroot
for HOST in 'localhost' 'localhost.localdomain' '127.0.0.1' '::1' '%'; do
    echo "SET PASSWORD FOR root@'${HOST}' = PASSWORD('${MYSQL_ROOT_PASS}');" | mysql -uroot
done

# Phalcon
yum install -y php-phalcon3

# Memcached
yum install -y memcached php-pecl-memcached

# phpMyAdmin
yum install -y --enablerepo=epel phpmyadmin
sed -i 's/127.0.0.1/192.168.33.1/' /etc/httpd/conf.d/phpMyAdmin.conf
sed -i "s/^?>$/\n\$cfg['LoginCookieValidity'] = 14400;\n?>/" /etc/phpMyAdmin/config.inc.php

# Disable SELinux
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

# Start services
systemctl restart httpd
systemctl enable httpd
systemctl restart mariadb
systemctl enable mariadb
