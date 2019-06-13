ius replace:
  cmd.run:
    - name: sed -i 's@baseurl=http://xt_cobbler_dhcp-pxe-dns-yum_01.nbnbnb.org/ius-docker_gitlab@baseurl=https://mirrors.aliyun.com/ius/stable/CentOS/7/$basearch@g' /etc/yum.repos.d/ius.repo
    - unless: test ${test -f /etc/yum.repos.d/ius.repo} = 1

mysql replace:
  cmd.run:
    - name: sed -i 's@baseurl=http://xt_cobbler_dhcp-pxe-dns-yum_01.nbnbnb.org/mysql57-community@baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/@g' /etc/yum.repos.d/mysql57-community.repo
    - unless: test ${test -f /etc/yum.repos.d/mysql57-community.repo} = 1

saltstack replace:
  cmd.run:
    - name: sed -i 's@baseurl=http://xt_cobbler_dhcp-pxe-dns-yum_01.nbnbnb.org/saltstack-2019.2@baseurl=http://192.168.56.11/saltstack2018.3@g' /etc/yum.repos.d/saltstack.repo
    - unless: test ${test -f /etc/yum.repos.d/saltstack.repo} = 1

zabbix replace:
  cmd.run:
    - name: sed -i 's@baseurl=http://xt_cobbler_dhcp-pxe-dns-yum_01.nbnbnb.org/zabbix-4.0@baseurl=https://mirrors.aliyun.com/zabbix/zabbix/4.0/rhel/7/x86_64/@g' /etc/yum.repos.d/zabbix.repo
    - unless: test ${test -f /etc/yum.repos.d/zabbix.repo} =1


after replace repo url to yum clean all && yum makecache:
  # Version 2014.1
  pkg.clean_metadata
  # Version 2019.2
  # pkg.refresh_db
