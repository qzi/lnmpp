#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# Source function library.
. /etc/rc.d/init.d/functions

# Source networking configuration.
. /etc/sysconfig/network

# Check that networking is up.
[ "$NETWORKING" = "no" ] && exit 0

# prepare for future
PHP_VERSION=php-5.4.0
PG_VERSION=postgresql-9.1.3
NGINX_VERSION=nginx-1.0.15
MYSQL_VERSION=mysql-5.5.21


#start shell script
LNMPP_ROOT=/tmp/lnmpp/lnmpp-0.01
PHP=$LNMPP_ROOT/php/$PHP_VERSION/sbin/php-fpm
NGINX=$LNMPP_ROOT/nginx/$NGINX_VERSION/sbin/nginx
PG_ROOT=$LNMPP_ROOT/pgsql/$PG_VERSION
PGDAEMON=$PG_ROOT/bin/postmaster
PGCTL=$PG_ROOT/bin/pg_ctl
PGUSER=postgres
PGDATA=$PG_ROOT/data
PGLOG=$PG_ROOT/logs/pgsql.log
MYSQL_ROOT=$LNMPP_ROOT/mysql/$MYSQL_VERSION
MYSQLDAEMON=$LNMPP_ROOT/mysql/$MYSQL_VERSION/bin/mysqld_safe

start()
{
	echo "-------------start pgsql---------------"
	su  $PGUSER -c "$PGDAEMON -D '$PGDATA' &" >>$PGLOG 2>&1
	echo "-------------pgsql started---------------"
	echo "-------------start php---------------"
	$PHP
	echo "-------------php started---------------"
	echo "-------------start nginx-------------"
	$NGINX
	echo "-------------nginx started---------------"
	echo "-------------start mysql-------------"
  $MYSQLDAEMON --user=mysql  --basedir=$MYSQL_ROOT --datadir=$MYSQL_ROOT/data &
	echo "-------------mysql started-------------"
	sleep 7
	ps -e | grep php
	ps -e | grep post
	ps -e | grep nginx
	ps -e | grep mysql
}
stop()
{
	echo "-------------stop php----------------"
	ps -e | grep $(basename $PHP) | {
	  while read pid tty time cmd;
	  do
	    echo "killing $pid ==> $cmd"
	    kill -9 $pid
 	  done
	}

	echo "-------------stop nginx--------------"
	killproc $NGINX -QUIT
	echo "-------------nginx stoped--------------"

	echo "-------------stop pgsql--------------"
	su  $PGUSER -c "$PGCTL stop -D '$PGDATA' -m fast"
	echo "-------------pgsql stoped--------------"

	echo "-------------stop mysql--------------"
  killall mysqld
	echo "-------------mysql stoped--------------"
  sleep 7
}
case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	reload)
		stop
		start
		;;
	*)
		echo $"Usage: $0 {start|stop|reload}"
		RETVAL=1
esac

exit $RETVAL
