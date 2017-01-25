## Summary

### OS

CentOS 7

### Installed Apps

* Apache
* MariaDB
    * root password is `pass`.
* PHP 7.0
* phpMyAdmin
* Phalcon 3
* Memcached
    * If you want to use memcached, you should not use `Phalcon\Cache\Backend\Memcache`, but should use `Phalcon\Cache\Backend\Libmemcached`.
* Xdebug


## Require

vagrant-vbguest

```sh
$ vagrant plugin install vagrant-vbguest
```


## Usage

```sh
$ git clone git@github.com:ryomo/vagrant-phalcon3-php7.git
$ cd vagrant-phalcon3-php7/
$ vagrant up
```


## Access

TOP: [http://192.168.33.12](http://192.168.33.12)

phpMyAdmin: [http://192.168.33.12/phpmyadmin/](http://192.168.33.12/phpmyadmin/)
