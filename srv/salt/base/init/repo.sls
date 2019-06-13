yum_base_repo_dir:
  cmd.run:
    - name: mv /etc/yum.repos.d /etc/yum.repos.d.bak
    - unless: test -d /etc/yum.repos.d.bak

  file.directory:
    - name: /etc/yum.repos.d
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
      - ignore_files

include:
  - init.repo_base
  - init.repo_epel
  - init.repo_zabbix
  - init.repo_saltstack
  - init.repo_nginx
  - init.repo_php_webtatic
  - init.repo_mysql
  - init.repo_ius
