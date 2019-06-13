include:
  - harbor.stop # cd /opt/harbor && docker-compose stop

remove docker images & stroge:
  cmd.run:
#    # test cmd:docker run -it --name gc --rm --volumes-from registry vmware/registry:2.6.2-photon garbage-collect --dry-run /etc/registry/config.yml
    - name: docker run -it --name gc --rm --volumes-from registry goharbor/registry-photon:v2.6.2-v1.7.5 garbage-collect  /etc/registry/config.yml"
    - require:
      - service: "harbor stop"

# force cmd!
# docker stop $(docker ps -q) & docker rm $(docker ps -aq)

#soft uninstall:
#  pkg.removed:
#    - names:
#      - soft

un docker network net.ipv4.ip_forward:
  sysctl.present:
    - name: net.ipv4.ip_forward
    - value: 0
