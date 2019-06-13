rpm tomcat stop:
  service.dead:
    - name: tomcat
    - enable: False
