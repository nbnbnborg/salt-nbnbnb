#gitlab-runsvdir stop:
#  service.dead:
#    - name: gitlab-runsvdir
#    - enable: False
# ps -ef|grep runsvdir|grep gitlab/service|awk '{print $2}'|xargs kill -9 && \

gitlab-ce uninstall:
  #pkg.removed:
  #  - name:
  #    - gitlab-ce
  #  - fromrepo: gitlab-ce
  cmd.run:
    - name: |
            gitlab-ctl stop && \
            gitlab-ctl remove-accounts && \
            gitlab-ctl cleanse && \
            rpm -e --nodeps gitlab-ce && \
            systemctl stop gitlab-runsvdir && \
            find / -name gitlab | xargs rm -rf

