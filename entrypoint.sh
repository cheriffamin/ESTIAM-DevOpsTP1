#! /bin/sh
/etc/init.d/mysql start
mysql -u root -p"amine" -h localhost < db.sql
/usr/sbin/apache2ctl -D FOREGROUND
