# =============================================================================
# h4ck4thon/centos-ssh-mysql
#
# CentOS-6, MySQL 5.1
#
# RUN:
#       docker run -d --name mysql.pool-1.1.1 -p 3306:3306 \
#               jdeathe/centos-ssh-mysql:latest
# LOGS:
#       docker logs mysql.pool-1.1.1
# ACCESS:
#       sudo /usr/bin/nsenter -m -u -i -n -p -t $(/usr/bin/docker inspect \
#               --format '{{ .State.Pid }}' mysql.pool-1.1.1) /bin/bash
#
# =============================================================================
FROM jdeathe/centos-ssh-apache-php

MAINTAINER H4CK1THON <jh4ck4thon@gmail.com>

# ============================================================================
# install php-mysql
# ============================================================================

RUN yum install php-mysql.x86_64

CMD ["httpd", "restart"]
