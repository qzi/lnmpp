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
echo "last modified in 2012/7/2"
echo "Email:i@qzier.com"
echo "========================================================================="
echo "========================================================================="
echo "PHP Version: 5.4.4"
echo "========================================================================="
echo "========================================================================="
echo "PostgreSQL Version: 9.1.4"
echo "========================================================================="
echo "========================================================================="
echo "nginx Version: 1.2.1"
echo "========================================================================="
echo "========================================================================="
echo "MySQL Version: 5.5.25"
echo "========================================================================="
echo "========================================================================="
echo "CentOS Version: 6.2_x86_64"
echo "========================================================================="
# prepare for future
PHP_VERSION=php-5.4.4
PG_VERSION=postgresql-9.1.4
NGINX_VERSION=nginx-1.2.1
MYSQL_VERSION=mysql-5.5.25

LNMPP_SRC_ROOT=$(pwd)
LNMPP_ROOT=/tmp/lnmpp/lnmpp-0.02
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

#for filename in $(rpm -aq|grep flex)
#do
#  yum erase $filename
#  #yum erase $filename -y
#done

#for filename in $(rpm -aq|grep php)
#do
##  yum erase $filename
#  yum erase $filename -y
#done

echo "========================================================================="
echo "install dependences"
echo "========================================================================="

for packages in patch make gcc gcc-c++ gcc-g77 bison file libtool libtool-libs autoconf kernel-devel libjpeg libjpeg-devel libpng libpng-devel libpng10 libpng10-devel gd gd-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glib2 glib2-devel bzip2 bzip2-devel libevent libevent-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel vim-minimal nano fonts-chinese gettext gettext-devel ncurses-devel gmp-devel pspell-devel unzip autoconf re2c readline-devel ;
do yum -y install $packages; done

echo "============================check files=================================="

if [ -s $PHP_VERSION.tar.gz ]; then
  echo "$PHP_VERSION.tar.gz [found]"
else
  echo "Error: $PHP_VERSION.tar.gz not found!!!download now......"
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

if [ -s mcrypt-2.6.8.tar.gz ]; then
  echo "mcrypt-2.6.8.tar.gz [found]"
else
  echo "Error: mcrypt-2.6.8.tar.gz not found!!!download now......"
  wget http://sourceforge.net/projects/mcrypt/files/latest/download?source=files
fi

if [ -s mhash-0.9.9.9.tar.bz2 ]; then
  echo "mhash-0.9.9.9.tar.bz2 [found]"
else
  echo "Error: mhash-0.9.9.9.tar.bz2 not found!!!download now......"
  wget http://sourceforge.net/projects/mhash/files/latest/download?source=files
fi

if [ -s $PG_VERSION.tar.gz ]; then
  echo "$PG_VERSION.tar.gz [found]"
else
  echo "Error: $PG_VERSION.tar.gz not found!!!download now......"
  wget http://ftp.postgresql.org/pub/source/v9.1.4/$PG_VERSION.tar.gz # !!!!!!!!!!!!!!!!!!!!!!!!
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

if [ -s $MYSQL_VERSION.tar.gz ]; then
  echo "$MYSQL_VERSION.tar.gz is [found]"
else
  echo "Error: $MYSQL_VERSION.tar.gz not found!!!download now......"
  wget -c http://downloads.mysql.com/archives/mysql-5.5/$MYSQL_VERSION.tar.gz
fi

if [ -s cmake-2.8.7.tar.gz ]; then
  echo "cmake-2.8.7.tar.gz is [found]"
else
  echo "Error: cmake-2.8.7.tar.gz not found!!!download now......"
  wget -c http://www.cmake.org/files/v2.8/cmake-2.8.7.tar.gz 
fi

if [ -s libmcrypt-2.5.8.tar.gz ]; then
  echo "libmcrypt-2.5.8.tar.gz is [found]"
else
  echo "Error: libmcrypt-2.5.8.tar.gz not found!!!download now......"
  wget -c http://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz
fi

if [ -s re2c-0.13.5.tar.gz ]; then
  echo "re2c-0.13.5.tar.gz is [found]"
else
  echo "Error: re2c-0.13.5.tar.gz not found!!!download now......"
  wget -c http://sourceforge.net/projects/re2c/files/re2c/0.13.5/re2c-0.13.5.tar.gz
fi
# centos 6
##repoforge's rpm
#wget http://pkgs.repoforge.org/libmcrypt/libmcrypt-2.5.7-1.2.el6.rf.x86_64.rpm
#wget http://pkgs.repoforge.org/libmcrypt/libmcrypt-devel-2.5.7-1.2.el6.rf.x86_64.rpm
#rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
#rpm -K libmcrypt*.rpm
#rpm -iv libmcrypt-2.5.7-1.2.el6.rf.x86_64.rpm
#rpm -iv libmcrypt-devel-2.5.7-1.2.el6.rf.x86_64.rpm

echo "============================check complete=================================="

echo "============================postgresql install=================================="

#install flex
cd $LNMPP_SRC_ROOT 
$(pwd)
tar -zxvf flex-2.5.35.tar.gz
cd flex-2.5.35
make uninstall
make clean
./configure -q
make
make install
cd ../

tar -zxvf $PG_VERSION.tar.gz

if [ $(id -nu postgres) == "postgres" ]; then
  echo "user postgres is found ... "
else
  echo "creating the user called 'postgres'"
  su - -c "useradd -M postgres"
fi

chown -R postgres:postgres $PG_VERSION
mkdir -p $PG_ROOT
mkdir -p $PG_ROOT/etc 
cd $LNMPP_SRC_ROOT/$PG_VERSION/
make uninstall
make clean
./configure --prefix=$PG_ROOT #--sysconfdir=$PG_ROOT/etc
make
make install
if [ -d $PG_ROOT/data/ ]; then
  mv $PG_ROOT/data/ $PG_ROOT/data.bak/
  mkdir -p $PG_ROOT/data/
else	
  mkdir -p $PG_ROOT/data
fi
if [ -d $PG_ROOT/logs/ ]; then
#  rm $PG_ROOT/logs/* -rf
  mv $PG_ROOT/logs/ $PG_ROOT/logs.bak/
  mkdir -p $PG_ROOT/logs/
else
  mkdir -p $PG_ROOT/logs/
fi

#touch $PG_ROOT/logs/pgsql.log
chown -R postgres:postgres $PG_ROOT/data
chown -R postgres:postgres $PG_ROOT/logs
#usermod -G $(id -nu) postgres
#gpasswd -A postgres $(id -un) # previllege for current user
su postgres -c "/tmp/lnmpp/lnmpp-0.02/pgsql/postgresql-9.1.4/bin/initdb --pgdata=/tmp/lnmpp/lnmpp-0.02/pgsql/postgresql-9.1.4/data --encoding=UNICODE --username=postgres --xlogdir=/tmp/lnmpp/lnmpp-0.02/pgsql/postgresql-9.1.4/logs/ --auth=trust && exit" # enable local trust
##su postgres -c "$PG_ROOT/bin/pg_resetxlog -f $PG_ROOT/data && exit"
$(pwd)
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

if [ $(id -nu mysql) == "mysql" ]; then
  echo "user mysql is found ... "
else
  echo "creating the user called 'mysql'"
  su - -c "useradd -M mysql -s /sbin/nologin"
fi
mkdir -p $MYSQL_ROOT/etc
mkdir -p $MYSQL_ROOT/data
mkdir -p $MYSQL_ROOT/run
$(pwd)
tar -zxvf $MYSQL_VERSION.tar.gz
cd $MYSQL_VERSION
make uninstall
make clean
rm -f  CMakeCache.txt
$LNMPP_ROOT/cmake/cmake-2.8.7/bin/cmake \
  -DCMAKE_INSTALL_PREFIX=$MYSQL_ROOT \
  -DMYSQL_DATADIR=$MYSQL_ROOT/data \
  -DSYSCONFDIR=$MYSQL_ROOT/etc \
  -DWITH_MYISAM_STORAGE_ENGINE=1 \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 \
  -DWITH_ARCHIVE_STORAGE_ENGINE=1 \
  -DWITH_BLACKHOLE_STORAGE_ENGINE=1 \
  -DWITH_READLINE=1 \
  -DENABLED_LOCAL_INFILE=1 \
  -DDEFAULT_CHARSET=utf8 \
  -DDEFAULT_COLLATION=utf8_general_ci \
  -DEXTRA_CHARSETS=all \
  -DMYSQL_USER=mysql \
  -DMYSQL_TCP_PORT=3306 
make
make install


cp support-files/my-small.cnf $MYSQL_ROOT/etc/my.cnf
#chmod 755 $MYSQL_ROOT/scripts/mysql_install_db
chown -R mysql:mysql $MYSQL_ROOT
$MYSQL_ROOT/scripts/mysql_install_db --user=mysql --basedir=$MYSQL_ROOT --datadir=$MYSQL_ROOT/data --pid-file=$MYSQL_ROOT/run/mysqld.pid --log-error=$MYSQL_ROOT/run/mysqld.log --socket=$MYSQL_ROOT/run/mysqld.sock
#chmod +x /etc/init.d/mysqld
#cp support-files/mysql.server /etc/init.d/mysqld

echo "============================mysql complete=================================="



echo "============================php install=================================="

cd $LNMPP_SRC_ROOT
mkdir -p $PHP_EXTRA_LIBS

tar -zxf libiconv-1.14.tar.gz
cd libiconv-1.14
make uninstall
make clean
./configure
make
make install
cd ../

tar -zvxf re2c-0.13.5.tar.gz
cd re2c-0.13.5
make uninstall
make clean
./configure
make
make install
cd ../

tar -jxf mhash-0.9.9.9.tar.bz2
cd mhash-0.9.9.9
make uninstall
make clean
./configure
make
make install
cd ../

tar -zvxf libmcrypt-2.5.8.tar.gz
cd libmcrypt-2.5.8
make uninstall
make clean
./configure
make
make install
cd ../

tar -zxvf mcrypt-2.6.8.tar.gz
cd mcrypt-2.6.8
make uninstall
make clean
./configure   --prefix=$PHP_EXTRA_LIBS/mcrypt-2.6.8 --with-libiconv-prefix=$PHP_EXTRA_LIBS/libiconv-1.14/  --with-libmcrypt-prefix=/usr/local/lib
make
make install
cd ../

tar -jxf pcre-8.21.tar.bz2
cd pcre-8.21
make uninstall
make clean
./configure --prefix=$PHP_EXTRA_LIBS/pcre-8.21/
make
make install
cd ../

mkdir -p $PHP_ROOT 
tar -zxvf $PHP_VERSION.tar.gz 
cd $PHP_VERSION
make uninstall
make clean
./configure --prefix=$PHP_ROOT --with-config-file-path=$PHP_ROOT/etc/ --with-mysql=$MYSQL_ROOT --with-pdo-mysql=$MYSQL_ROOT --with-pgsql=$PG_ROOT --with-pdo-pgsql=$PG_ROOT --with-iconv=/usr/local --with-pcre-dir=$PHP_EXTRA_LIBS/pcre-8.21 --enable-fpm --with-pear --with-gd --enable-gd-native-ttf --with-freetype-dir=/usr --with-zlib --enable-mbstring --with-curl --with-openssl --with-mhash=/usr/local --with-mcrypt=$PHP_EXTRA_LIBS/mcrypt-2.6.8
make 
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
./configure --user=nginx --group=nginx --prefix=$NGINX_ROOT --with-http_ssl_module --with-pcre=$LNMPP_SRC_ROOT/pcre-8.21 --with-ipv6
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
MYSQL_ROOT=$LNMPP_ROOT/mysql/$MYSQL_VERSION
MYSQLDAEMON=$LNMPP_ROOT/mysql/$MYSQL_VERSION/bin/mysqld_safe


stop()
{
  echo "	>>> stop php----------------"
  ps -e | grep $(basename $PHP) | {
    while read pid tty time cmd;
    do
      echo "	killing $pid ==> $cmd"
      kill -9 $pid
    done
  }

  echo "	>>> stop nginx--------------"
  ps -e | grep $(basename $NGINX) | {
    while read pid tty time cmd;
    do
      echo "	killing $pid ==> $cmd"
      kill -9 $pid
    done
  }

  echo "	>>> stop pgsql--------------"
  ps -e | grep $(basename $PGDAEMON) | {
    while read pid tty time cmd;
    do
      echo "	killing $pid ==> $cmd"
      kill -9 $pid
    done
  }

  echo "	>>> stop mysql--------------"
  killall mysqld
  sleep 7
}

start()
{
  echo "	>>> start php---------------"
  $PHP
  echo "	>>> php started ------------"
  echo "	>>> start nginx-------------"
  $NGINX
  echo "	>>> nginx started-----------"
  echo "	>>> start pgsql-------------"
  touch $PGLOG 
  su  $PGUSER -c "$PGDAEMON -D '$PGDATA' &" >>$PGLOG 2>&1
  echo "	>>> pgsql started-----------"
  echo "	>>> start mysql-------------"
  $MYSQLDAEMON --user=mysql --basedir=$MYSQL_ROOT --datadir=$MYSQL_ROOT/data --pid-file=$MYSQL_ROOT/run/mysqld.pid --log-error=$MYSQL_ROOT/run/mysqld.log --socket=$MYSQL_ROOT/run/mysqld.sock & 
  echo "	>>> mysql started-----------"
  sleep 7
}

stop
start

ps -C php-fpm
ps -C nginx
ps -C postmaster
ps -C mysqld
ps -C mysqld_safe
echo "============================LNMPP started================================="
exit 0
