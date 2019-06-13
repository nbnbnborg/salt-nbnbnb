haproxy uninstall:
  pkg.removed:
    - name: haproxy
    - unless: test ${rpm -q haproxy} = 1

haproxy18u uninstall:
  pkg.removed:
    - name: haproxy
    - unless: test ${rpm -q haproxy18u} = 1 

#include:
 # - ius.yum-replace-uninstall

