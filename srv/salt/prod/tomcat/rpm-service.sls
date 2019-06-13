include:
  - tomcat.rpm-install

rpm tomcat service:
  service.running:
    - name: tomcat
    - enable: True
    - reload: True

