chrony install:
  pkg.installed:
    - name: chrony

chrony conf:
  file.managed:
    - name: /etc/chrony.conf
    - source: salt://init/files/chrony.conf.template
    - template: jinja
    - default:
      # remember replace ip
      CHRONY_SERVER: {{ pillar['chrony']['server_ip'] }}

chrony service:
  service.running:
    - name: chronyd
    - enable: True
    - reload: True
    - require:
      - file: "chrony conf"
    - watch:
      - file: "chrony conf"
