# for security,we will not to use this http://IP:PORT/manager/html
# this file maybe is must be call from server.xml,so need to use.
/usr/local/tomcat/conf/tomcat-users.xml:
  file.managed:
    - source: salt://tomcat/tomcat-users.xml.template
    - template: jinja
    - user: www
    - group: www
    - mode: 644
    - defaults:
      TOMCAT_GUIADMIN_USER: tomcat_uuid
      TOMCAT_GUIADMIN_PASSWD: tomcat_uuid

/usr/local/tomcat/webapps/manager/META-INF/context.xml:
  file.managed:
    - source: salt://tomcat/context.xml.template
    - template: jinja
    - user: www
    - group: www
    - mode: 644
    - defaults:
      IP: \d+\.\d+\.\d+\.\d+

