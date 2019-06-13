include:
  - jdk.uninstall

tomcat rpm uninstall:
  pkg.removed:
    - name: tomcat
    - unless: test ${rpm -q tomcat} = 1


