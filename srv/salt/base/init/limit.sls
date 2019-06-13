limits-config:
  file.managed:
    - name: /etc/security/limits.conf
    - source: salt://init/files/limits.conf
    - user: root
    - group: root
    - mode: 644

limits(* - nofile 65535):
  file.append: 
    - name: /etc/security/limits.conf
    # 单行方式添加，有星号无法被saltstack渲染；使用多行方式添加即可
    - text: |
        * - nofile 65535

