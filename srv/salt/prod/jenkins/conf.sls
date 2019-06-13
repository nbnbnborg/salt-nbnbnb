/etc/sysconfig/jenkins:
  file.managed:
    - name: /etc/sysconfig/jenkins
    - source: salt://jenkins/jenkins.template
    - template: jinja
    - user: root
    - group: root
    - mode: 600
    - default:
      JENKINS_PORT: 8081

#update plugin conf:
#  file.managed:
#    - name: /var/lib/jenkins/updates/default.json
#    - source: salt://jenkins/default.json.template
#    - user: jenkins
#    - group: jenkins
#    - mode: 644
#    - unless: test ! -d /var/lib/jenkins/updates
#    #- template: jinja
#    #- default:
#    #  connectionCheckUrl: https://www.baidu.com/

#json_value_modify.py:
#  file.managed:
#    - name: /var/lib/jenkins/updates/json_value_modify.py
#    - source: salt://jenkins/json_value_modify.py
#    - user: root
#    - group: root
#    - mode: 755
#    - unless: test ! -d /var/lib/jenkins/updates

# start jenkins to create /var/lib/jenkins/updates/default.json file.
#update plugin conf:
#  cmd.run:
#    #- name: sed 's/\("connectionCheckUrl":"\).*/\1https:\/\/www.baidu.com"/g' /var/lib/jenkins/updates/default.json
#    - name: /usr/bin/python /var/lib/jenkins/updates/json_value_modify.py connectionCheckUrl https://www.baidu.com /var/lib/jenkins/updates/default.json
#    - unless: test ! -f /var/lib/jenkins/updates/default.json
