{% set tomcat_version = "9.0.19" %}

include:
  - jdk.install

src tomcat install:
  file.managed:
    - name: /usr/local/src/apache-tomcat-{{ tomcat_version }}.tar.gz
    - source: salt://tomcat/apache-tomcat-{{ tomcat_version }}.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src && tar xf apache-tomcat-{{ tomcat_version }}.tar.gz && mv apache-tomcat-{{ tomcat_version }} /usr/local/ && ln -s /usr/local/apache-tomcat-{{ tomcat_version }} /usr/local/tomcat && chown -R www:www /usr/local/tomcat/ && chown -R www:www /usr/local/tomcat
    - unless: test -d /usr/local/apache-tomcat-{{ tomcat_version }} && test -L /usr/local/tomcat
    - require:
      - pkg: "java-1.8.0-openjdk install"
      - file: "src tomcat install"

systemd tomcat init:
  file.managed:
    - name: /usr/lib/systemd/system/tomcat.service
    - source: salt://tomcat/tomcat.service.template
    - mode: 755
    - user: root
    - group: root
  cmd.run:
    - name: systemctl daemon-reload
    - unless: test ! -f /lib/systemd/system/tomcat.service
    - require:
      - file: "systemd tomcat init"
