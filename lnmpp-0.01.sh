#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# Check if user is root
if [ $(id -u) != "0" ]; then
  echo "Error: You must be root to run this script, please use root to install LNMPP"
  exit 1
fi

clear
echo "========================================================================="
echo "lnmpp install shell script for CentOS/RadHat Written by Qzi"
echo "creatred in 2012/4/10"
echo "last modified in 2012/4/14"
echo "Email:i@qzier.com"
echo "========================================================================="
echo "========================================================================="
echo "PHP Version: 5.4.0"
echo "========================================================================="
echo "========================================================================="
echo "PostgreSQL Version: 9.1.3"
echo "========================================================================="
echo "========================================================================="
echo "nginx Version: 1.0.15"
echo "========================================================================="
echo "========================================================================="
echo "MySQL Version: 5.5.21"
echo "========================================================================="


# prepare for future
PHP_VERSION=php-5.4.0
PG_VERSION=postgresql-9.1.3
NGINX_VERSION=nginx-1.0.15
MYSQL_VERSION=mysql-5.5.21

LNMPP_SRC_ROOT=$(pwd)
LNMPP_ROOT=/tmp/lnmpp/lnmpp-0.01
PG_ROOT=$LNMPP_ROOT/pgsql/$PG_VERSION
PHP_ROOT=$LNMPP_ROOT/php/$PHP_VERSION
PHP_EXTRA_LIBS=$PHP_ROOT/3rdlibs
NGINX_ROOT=$LNMPP_ROOT/nginx/$NGINX_VERSION
MYSQL_ROOT=$LNMPP_ROOT/mysql/$MYSQL_VERSION


if [ -d $LNMPP_ROOT ]; then
  echo "LNMPP will install in $LNMPP_ROOT"
else
  echo "LNMPP is creating the directory $LNMPP_ROOT"
  mkdir -p $LNMPP_ROOT
fi

for filename in $(rpm -aq|grep flex)
do
  yum erase $filename
  #yum erase $filename -y
done

for filename in $(rpm -aq|grep php)
do
  yum erase $filename
  #yum erase $filename -y
done

echo "========================================================================="
echo "install dependences"
echo "========================================================================="

for packages in patch make gcc gcc-c++ gcc-g77 bison file libtool libtool-libs autoconf kernel-devel libjpeg libjpeg-devel libpng libpng-devel libpng10 libpng10-devel gd gd-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glib2 glib2-devel bzip2 bzip2-devel libevent libevent-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel vim-minimal nano fonts-chinese gettext gettext-devel ncurses-devel gmp-devel pspell-devel unzip autoconf re2c;
do yum -y install $packages; done

echo "============================check files=================================="

if [ -s $PHP_VERSION.tar.gz ]; then
  echo "$PHP_VERSION.tar.gz [found]"
else
  echo "Error: $PHP_VERSION.tar.gz not found!!!download now......"
  #  wget -c http://cn2.php.net/get/$PHP_VERSION.tar.gz/from/jp.php.net/mirror
  wget -c http://cn2.php.net/get/$PHP_VERSION.tar.gz/from/cn.php.net/mirror 
fi

if [ -s libiconv-1.14.tar.gz ]; then
  echo "libiconv-1.14.tar.gz [found]"
else
  echo "Error: libiconv-1.14.tar.gz not found!!!download now......"
  wget -c http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz
fi

if [ -s pcre-8.21.tar.bz2 ]; then
  echo "pcre-8.21.tar.bz2 [found]"
else
  echo "Error: pcre-8.21.tar.bz2 not found!!!download now......"
  wget http://downloads.sourceforge.net/project/pcre/pcre/8.21/pcre-8.21.tar.bz2
fi

if [ -s $PG_VERSION.tar.gz ]; then
  echo "$PG_VERSION.tar.gz [found]"
else
  echo "Error: $PG_VERSION.tar.gz not found!!!download now......"
  wget http://ftp.postgresql.org/pub/source/v9.1.3/$PG_VERSION.tar.gz # !!!!!!!!!!!!!!!!!!!!!!!!
fi

if [ -s $NGINX_VERSION.tar.gz ]; then
  echo "$NGINX_VERSION.tar.gz [found]"
else
  echo "Error: $NGINX_VERSION.tar.gz not found!!!download now......"
  wget http://nginx.org/download/$NGINX_VERSION.tar.gz
fi

if [ -s flex-2.5.35.tar.gz ]; then
  echo "flex-2.5.35.tar.gz [found]"
else
  echo "Error: flex-2.5.35.tar.gz not found!!!download now......"
  wget http://sourceforge.net/projects/flex/files/flex/flex-2.5.35/flex-2.5.35.tar.gz
fi

if [ -d $MYSQL_VERSION.tar.gz ]; then
  echo "$MYSQL_VERSION.tar.gz is [found]"
else
  echo "Error: $MYSQL_VERSION.tar.gz not found!!!download now......"
  wget -c http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-5.5/mysql-5.5.21.tar.gz 
fi

if [ -d cmake-2.8.7.tar.gz ]; then
  echo "cmake-2.8.7.tar.gz is [found]"
else
  echo "Error: cmake-2.8.7.tar.gz not found!!!download now......"
  wget -c http://www.cmake.org/files/v2.8/cmake-2.8.7.tar.gz 
fi

echo "============================check complete=================================="

echo "============================postgresql install=================================="

#install flex
tar flex-2.5.35.tar.gz
make clean
make && make install

mkdir -p $PG_ROOT
tar -zxvf $PG_VERSION.tar.gz

if [ $(id -nu postgres) == "postgres" ]; then
  echo "user postgres is found ... "
else
  echo "creating the user called 'postgres'"
  su - -c "useradd -M postgres"
fi

chown -R postgres:postgres $PG_VERSION
mkdir -p $PG_ROOT/etc 
cd $PG_VERSION
make clean
./configure --prefix=$PG_ROOT --sysconfdir=$PG_ROOT/etc
make
make install
if [ -d $PG_ROOT/data ]; then
  mv $PG_ROOT/data $PG_ROOT/data.bak
  mkdir -p $PG_ROOT/data
else	
  mkdir -p $PG_ROOT/data
fi
mkdir -p $PG_ROOT/logs
touch $PG_ROOT/logs/pgsql.log
chown postgres:postgres $PG_ROOT/data
su postgres -c "$PG_ROOT/bin/initdb -D $PG_ROOT/data && exit"

echo "============================postgresql complete=================================="
echo "============================mysql install=================================="

cd $LNMPP_SRC_ROOT
mkdir -p $LNMPP_ROOT/cmake/cmake-2.8.7
tar -zxvf cmake-2.8.7.tar.gz
cd cmake-2.8.7
./bootstrap  --prefix=$LNMPP_ROOT/cmake/cmake-2.8.7
make 
make install 
cd ../

mkdir -p $MYSQL_ROOT/etc
mkdir -p $MYSQL_ROOT/data
tar -zxvf $MYSQL_VERSION.tar.gz
cd $MYSQL_VERSION
$LNMPP_ROOT/cmake/cmake-2.8.7/bin/cmake \
  -DCMAKE_INSTALL_PREFIX=$MYSQL_ROOT \
  -DMYSQL_DATADIR=$MYSQL_ROOT/data \
  -DSYSCONFDIR=$MYSQL_ROOT/etc \
  -DWITH_MYISAM_STORAGE_ENGINE=1 \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 \
  -DWITH_ARCHIVE_STORAGE_ENGINE=1 \
  -DWITH_BLACKHOLE_STORAGE_ENGINE=1 \
  -DENABLED_LOCAL_INFILE=1 \
  -DDEFAULT_CHARSET=utf8 \
  -DDEFAULT_COLLATION=utf8_general_ci \
  -DEXTRA_CHARSETS=all \
  #-DMYSQL_USER=mysql
-DMYSQL_TCP_PORT=3306
make
make install

if [ $(id -nu mysql) = "mysql" ]; then
  echo "user mysql is found ... "
else
  echo "creating the user called 'mysql'"
  su - -c "useradd -M mysql"
fi

cp support-files/my-small.cnf $MYSQL_ROOT/etc/my.cnf
chmod 755 $MYSQL_ROOT/scripts/mysql_install_db
$MYSQL_ROOT/scripts/mysql_install_db --user=mysql --basedir=$MYSQL_ROOT --datadir=$MYSQL_ROOT/data
#chmod +x /etc/init.d/mysqld
#cp support-files/mysql.server /etc/init.d/mysqld

echo "============================mysql complete=================================="

echo "============================php install=================================="

cd $LNMPP_SRC_ROOT
mkdir -p $PHP_EXTRA_LIBS

tar -zxf libiconv-1.14.tar.gz
cd libiconv-1.14
make clean
./configure --prefix=$PHP_EXTRA_LIBS/libiconv-1.14/
make
make install
ls $PHP_EXTRA_LIBS/libiconv-1.14/
cd ../

tar -jxf pcre-8.21.tar.bz2
cd pcre-8.21
make clean
./configure --prefix=$PHP_EXTRA_LIBS/pcre-8.21/
make
make install
cd ../

mkdir -p $PHP_ROOT 
tar -zxvf $PHP_VERSION.tar.gz 
cd $PHP_VERSION
make clean

./configure --prefix=$PHP_ROOT --with-config-file-path=$PHP_ROOT/etc/ --with-iconv=$PHP_EXTRA_LIBS/libiconv-1.14 --with-pcre-dir=$PHP_EXTRA_LIBS/pcre-8.21 --with-pgsql=$PG_ROOT --with-pdo-pgsql=$PG_ROOT --with-mysql=$MYSQL_ROOT --with-pdo-mysql=$MYSQL_ROOT --enable-fpm --with-pear --with-gd --enable-gd-native-ttf --with-freetype --with-zlib --enable-mbstring --with-curl --with-openssl
make 
##make ZEND_EXTRA_LIBS ='-liconv'
make install
cp ./php.ini-production $PHP_ROOT/etc/php.ini
cp $PHP_ROOT/etc/php-fpm.conf.default $PHP_ROOT/etc/php-fpm.conf
cd ../

echo "============================php complete================================="


echo "============================nginx install================================="

mkdir -p $NGINX_ROOT
tar -zxvf $NGINX_VERSION.tar.gz
cd $NGINX_VERSION 

if [ $(id -nu nginx) == "nginx" ]; then
  echo "user nginx is found ... "
else
  echo "creating the user called 'nginx'"
  su - -c "useradd -M nginx"
fi

make clean
./configure --user=nginx --group=nginx --prefix=$NGINX_ROOT --with-http_ssl_module --with-pcre=$LNMPP_SRC_ROOT/pcre-8.21
make
make install
cd ../
cp $NGINX_ROOT/conf/nginx.conf $NGINX_ROOT/conf/nginx.conf.bak2
cat $NGINX_ROOT/conf/nginx.conf | sed -e '65,72s/^        #/        /g'| \
  sed -e 's/\/scripts$fastcgi_script_name;/$document_root$fastcgi_script_name;/g'  > $NGINX_ROOT/conf/nginx.conf.bak
cp -f $NGINX_ROOT/conf/nginx.conf.bak $NGINX_ROOT/conf/nginx.conf
echo "============================nginx complete================================="
echo "============================phpinfo in /nginx/html================================="

#phpinfo
cat >$NGINX_ROOT/html/phpinfo.php<<eof
<?php
phpinfo();
?>
eof
echo "phpinfo.php is creating ..." 
echo "============================phpinfo.php writed================================="
echo "============================starting LNMPP================================="

PHP=$PHP_ROOT/sbin/php-fpm
NGINX=$NGINX_ROOT/sbin/nginx
PGDAEMON=$PG_ROOT/bin/postmaster
PGCTL=$PG_ROOT/bin/pg_ctl
PGUSER=postgres
PGDATA=$PG_ROOT/data
PGLOG=$PG_ROOT/logs/pgsql.log

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
  ps -e | grep $(basename $NGINX) | {
    while read pid tty time cmd;
    do
      echo "killing $pid ==> $cmd"
      kill -9 $pid
    done
  }

    # killproc $NGINX -QUIT

  echo "-------------stop pgsql--------------"
  #    su  $PGUSER -c "$PGCTL stop -D '$PGDATA' -m fast"
  ps -e | grep $(basename $PGDAEMON) | {
    while read pid tty time cmd;
    do
      echo "killing $pid ==> $cmd"
      kill -9 $pid
    done
  }

  echo "-------------stop pgsql--------------"

  echo "-------------stop mysql--------------"
  killall mysqld
  echo "-------------mysql stoped--------------"
  sleep 7
}

start()
{
  echo "-------------start php---------------"
  $PHP
  echo "-------------php started ---------------"
  echo "-------------start nginx-------------"
  $NGINX
  echo "-------------nginx started---------------"
  echo "-------------start pgsql---------------"
  su  $PGUSER -c "$PGDAEMON -D '$PGDATA' &" >>$PGLOG 2>&1
  echo "-------------pgsql started---------------"
  echo "-------------start mysql-------------"
  $MYSQLDAEMON --user=mysql  --basedir=$MYSQL_ROOT --datadir=$MYSQL_ROOT/data &
  echo "-------------mysql started-------------"
  sleep 7
}

stop
start

ps -C php-fpm
ps -C nginx
ps -C postmaster
ps -C mysql
echo "============================LNMPP started================================="
exit 0
