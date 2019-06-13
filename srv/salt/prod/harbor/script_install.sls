include:
  - harbor.conf

harbor script:
  cmd.run:
    #/usr/bin/python /opt/harbor/prepare && 
    - name: /bin/bash /opt/harbor/install.sh #--with-notary --with-clair --with-chartmuseum
