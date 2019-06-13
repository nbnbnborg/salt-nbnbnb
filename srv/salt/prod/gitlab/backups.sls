gitlab-ce backup:
  cmd.run:
    - name: "gitlab-rake gitlab:backup:create"

# /var/opt/gitlab/backups                   # 备份文件文件夹
# /var/opt/gitlab/git-data/repositories     # git仓库源文件
