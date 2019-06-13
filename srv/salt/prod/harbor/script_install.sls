include:
  - harbor.service

harbor script:
  cmd.run:
    - name: /usr/bin/python /opt/harbor/prepare && /bin/bash /opt/harbor/install.sh
