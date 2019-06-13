epel 7 repo:
  file.managed:
    - name: /etc/yum.repos.d/epel.repo
    - source: salt://init/files/epel-7.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      GPGCHECK: 1

# yum_epel_repo:   #其实epel这里也应该是file.append，因为相关的rpm包也应该是我们从官网搞的做成的一个yum仓库
#   pkg.installed:
#    - sources:  #这个参数就是可以执行远程的rpm包的路径
#     {% if grains['os'] == 'CentOS' and grains['osmajorrelease'] == '7' %}  #这里就要用到了判断了，如果是Centos7的系统下载rpm包的链接跟Centos6的是不一样的。
#       - epel-release: http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
#     {% elif grains['os'] == 'CentOS' and grains['osmajorrelease'] == '6'%}
#       - epel-release: http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#     {% endif %}   
#    - unless: rpm -qa|grep epel-release  #如果本地没有安装epel就执行，不然又是报错，onlyif:正好跟unless相反，条件为真时执行 。
