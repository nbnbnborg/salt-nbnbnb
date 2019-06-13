{% set tomcat_version = "9.0.19" %}

include:
  - tomcat.stop

/usr/lib/systemd/system/tomcat.service:
  file.absent:
    - require:
      - service: "tomcat stop"

/usr/local/apache-tomcat-{{tomcat_version}}:
  file.absent:
    - unless: test ${test -d /usr/local/apache-tomcat-{{tomcat_version}}} = 0

/usr/local/tomcat:
  file.absent:
    - unless: test ${test -L /usr/local/tomcat} = 0
