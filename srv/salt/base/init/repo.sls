# if went to run cmd: "yum_base_repo_dir", first run need to run twice.

#yum_base_repo_dir:
#  cmd.run:
#    - name: mv /etc/yum.repos.d /etc/yum.repos.d.bak
#    - unless: test -d /etc/yum.repos.d.bak
#
#  file.directory:
#    - name: /etc/yum.repos.d
#    - user: root
#    - group: root
#    - dir_mode: 755
#    - file_mode: 644
#    - makedirs: True
#    - recurse:
#      - user
#      - group
#      - mode
#      - ignore_files

include:
  - init.repo_base
  - init.repo_epel
  - init.repo_zabbix
  - init.repo_saltstack
  - init.repo_nginx
  - init.repo_mysql
  - init.repo_ius

  # Special case,i in company.
  #- init.repo_replace_url

yum clean all && yum makecache:
  # Version 2014.1
  pkg.clean_metadata
  # Version 2019.2
  # pkg.refresh_db

# default files in /etc/yum.repo.d/
#CentOS-Base.repo
#CentOS-CR.repo
#CentOS-Debuginfo.repo
#CentOS-fasttrack.repo
#CentOS-Media.repo
#CentOS-Sources.repo
#CentOS-Vault.repo

