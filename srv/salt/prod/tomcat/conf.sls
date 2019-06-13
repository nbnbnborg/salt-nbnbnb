/usr/local/tomcat/conf/server.xml:
  file.managed:
    - source: salt://tomcat/server.xml.template
    - template: jinja
    - user: www
    - group: www
    - mode: 644
    - default:
      PORT: 8089
    - unless: test ! -L /usr/local/tomcat
