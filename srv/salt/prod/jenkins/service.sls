include:
  - jenkins.conf

jenkins service:
  service.running:
    - name: jenkins
    - enable: True
    - reload: True
    - require:
      - file: /etc/sysconfig/jenkins
    - watch:
      - file: /etc/sysconfig/jenkins


