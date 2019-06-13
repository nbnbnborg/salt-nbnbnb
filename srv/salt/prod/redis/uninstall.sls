redis-uninstall:
  pkg.removed:
    - name: redis
    - unless: test ${rpm -q redis} = 1 

redis5-uninstall:
  pkg.removed:
    - name: redis5
    - unless: test ${rpm -q redis5} = 1

include:
  - ius.yum-replace-uninstall
