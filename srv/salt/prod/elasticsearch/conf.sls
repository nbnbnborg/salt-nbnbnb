/etc/elasticsearch/elasticsearch.yml:
  file.managed:
    - name: /etc/elasticsearch/elasticsearch.yml
    - source: salt://elasticsearch/elasticsearch.yml.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      CLUSTER_NAME: elasticsearch-demo
      NODE_NAME: {{ grains['fqdn'] }}
      BOOTSTARP_MEMORY_LOCK: true
      NETWORK_HOST: {{ grains['fqdn_ip4'][0] }}
      HTTP_PORT: 9200
      CLUSTER_INITIAL_MASTER_NODES: '["linux-node2.example.com", "linux-node3.example.com"]'
      #CLUSTER_INITIAL_MASTER_NODES: '["192.168.56.12", "192.168.56.13"]'

#path.data: /var/lib/elasticsearch
#path.logs: /var/log/elasticsearch

limits(memlock unlimited):
  file.append:
    - name: /etc/security/limits.conf
    # 单行方式添加，有星号无法被saltstack渲染；使用多行方式添加即可
    - text: |
        * soft memlock unlimited 
        * hard memlock unlimited 
