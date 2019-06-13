elasticsearch repo:
  file.managed:
    - name: /etc/yum.repos.d/elasticsearch.repo
    - source: salt://elasticsearch/elasticsearch.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      GPGCHECK: 0
