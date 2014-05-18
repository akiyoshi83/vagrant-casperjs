#!/bin/sh
# -*- coding: utf-8-unix -*-

CASPERJS=casperjs-1.1-beta3-0
PHANTOMJS=phantomjs-1.9.7-linux-x86_64

# Japanese for PhantomJS capture
yum -y groupinstall "Japanese Support"
localedef -f UTF-8 -i ja_JP ja_JP.utf8
localedef -f SHIFT_JIS -i ja_JP ja_JP.sjis
localedef -f EUC-JP -i ja_JP ja_JP.eucjp

# instll basic software
yum install -y initscripts zip unzip vim tree

# phantomjs dependency
yum install -y freetype fontconfig

# casperjs
(cd /opt/; unzip /vagrant/package/${CASPERJS}.zip)
chmod +x /opt/${CASPERJS}/bin/casperjs
echo "export PATH=/opt/${CASPERJS}/bin/:\$PATH" >> /etc/profile.d/gctest.sh

# phantomjs
tar -C /opt/ -xjvf /vagrant/package/${PHANTOMJS}.tar.bz2
echo "export PATH=/opt/${PHANTOMJS}/bin/:\$PATH" >> /etc/profile.d/gctest.sh
