# doc:https://github.com/jaywcjlove/handbook/blob/master/CentOS/CentOS7%E5%AE%89%E8%A3%85%E7%BB%B4%E6%8A%A4Gitlab.md


#gitlab-ce restore:
#  cmd.run:
#    - name: |
#            gitlab-ctl stop unicorn && \
#            gitlab-ctl stop sidekiq && \
#            gitlab-rake gitlab:backup:restore BACKUP=`ls /var/opt/gitlab/backups/|sort|tail -1|awk '{print substr($1,1,29)}'` && \
#            gitlab-ctl start
