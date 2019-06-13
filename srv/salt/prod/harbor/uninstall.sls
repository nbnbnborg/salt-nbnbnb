# cd /opt/harbor && docker-compose stop
# docker stop $(docker ps -q) & docker rm $(docker ps -aq)

soft uninstall:
  pkg.removed:
    - names:
      - soft
