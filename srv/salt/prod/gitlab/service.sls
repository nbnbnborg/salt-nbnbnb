include:
  - gitlab.install
  - gitlab.conf

gitlab-ce service:
  cmd.run:
    - name: "gitlab-ctl reconfigure && gitlab-ctl start"
 
