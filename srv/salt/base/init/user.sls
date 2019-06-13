user group www create:
  group.present:
    - name: www
    - gid: 1000
  user.present:
    - name: www
    - fullname: www
    - shell: /sbin/bash
    #- home: /home/www
    - uid: 1000
    - gid: 1000
    - groups:
      - www

#
#user www remove:
#  user.absent:
#    - name: www
