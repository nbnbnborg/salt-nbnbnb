include:
  - tomcat.install
#  - tomcat.manage
  - tomcat.conf

tomcat service:
  service.running:
    - name: tomcat
    - enable: True
    - reload: True
    - require:
      - file: "systemd tomcat init"
    - watch:
      - file: /usr/local/tomcat/conf/server.xml
#      - file: /usr/local/tomcat/conf/tomcat-users.xml
#      - file: /usr/local/tomcat/webapps/manager/META-INF/context.xml
