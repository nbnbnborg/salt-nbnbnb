# please read docx file to add 5 sec/optimization.


/etc/haproxy/haproxy.cfg:
  file.managed:
    - name: /etc/haproxy/haproxy.cfg
    - source: salt://haproxy/haproxy.cfg.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
      TIMEOUT_CONNECT: 5s
      TIMEOUT_CLIENT: 1m
      TIMEOUT_SERVER: 1m
      MAXCONN: 3000

      HAPROXY_VIP: {{ pillar['haproxy']['HAPROXY_VIP'] }}
      HAPROXY_PORT: {{ pillar['haproxy']['HAPROXY_PORT'] }}
      DEFAULT_BACKEND: {{ pillar['haproxy']['DEFAULT_BACKEND'] }}

      BALANCE: roundrobin

      REAL_SERVER_1_NAME: {{ pillar['haproxy']['REAL_SERVER_1_NAME'] }}
      REAL_SERVER_1_IP: {{ pillar['haproxy']['REAL_SERVER_1_IP'] }} 
      REAL_SERVER_1_PORT: {{ pillar['haproxy']['REAL_SERVER_1_PORT'] }}
      REAL_SERVER_2_NAME: {{ pillar['haproxy']['REAL_SERVER_2_NAME'] }}
      REAL_SERVER_2_IP: {{ pillar['haproxy']['REAL_SERVER_2_IP'] }}
      REAL_SERVER_2_PORT: {{ pillar['haproxy']['REAL_SERVER_2_PORT'] }}


/etc/haproxy:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

haproxy log conf commit:
  file.managed:
    - name: /etc/rsyslog.conf
    - source: salt://haproxy/rsyslog.conf.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      HAPROXY_CONF: "#see /etc/rsyslog.d/haproxy.conf"

haproxy log conf:
  file.managed:
    - name: /etc/rsyslog.d/haproxy.conf
    - source: salt://haproxy/rsyslog-haproxy.conf.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644

rsyslog restart for haproxy:
  service.running:
    - name: rsyslog
    - enable: True
    - reload: True
    - require:
      - file: "haproxy log conf"
    - watch:
      - file: "haproxy log conf"

