/etc/gitlab/gitlab.rb:
  file.managed:
    - name: /etc/gitlab/gitlab.rb
    - source: salt://etc/gitlab/gitlab.rb.template
    - user: root
    - group: root
    - mode: 600
    - default:
      EXTERNAL_URL: http://xt-cicd-jenkins-01.nbnbnb.org

/opt/gitlab/embedded/service/gitlab-rails/config/gitlab.yml:
  file.managed:
    - name: /opt/gitlab/embedded/service/gitlab-rails/config/gitlab.yml
    - source: salt://etc/gitlab/gitlab.yml.template
    - user: root
    - group: root
    - mode: 644
    - defaults:
      HOST: xt-cicd-jenkins-01.nbnbnb.org
      PORT: 80
      HTTPS: false

#/etc/soft.d:
#  file.directory:
#    - user: root
#    - group: root
#    - dir_mode: 755
#    - file_mode: 644
#    - recurse:
#      - user
#      - group
#      - mode
