Python UTF-8:
  file.managed:
    - name: /usr/lib/python2.7/site-packages/sitecustomize.py
    - source: salt://init/files/sitecustomize.py
    - user: root
    - group: root
    - mode: 644
