include:
  - haproxy.stop

# maybe should think of other service,is another use it.
set ip_nonlocal_bind = 0:
  sysctl.present:
    - name: net.ipv4.ip_nonlocal_bind
    - value: 0

delete haproxy log conf:
  file.absent:
    - name: /etc/rsyslog.d/haproxy.conf

haproxy uninstall:
  pkg.removed:
    - name: haproxy
    - unless: test ${rpm -q haproxy} = 1

haproxy18u uninstall:
  pkg.removed:
    - names: 
      - haproxy18u
      - lua53u-libs
    - unless: test ${rpm -q haproxy18u} = 1 

#include:
 # - ius.yum-replace-uninstall

