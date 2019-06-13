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

update plugin conf:
  file.managed:
    - name: /var/lib/jenkins/updates/default.json
    - source: salt://jenkins/default.json.template
    #- template: jinja
    - user: jenkins
    - group: jenkins
    - mode: 644
    #- default:
    #  connectionCheckUrl: http://www.baidu.com/
