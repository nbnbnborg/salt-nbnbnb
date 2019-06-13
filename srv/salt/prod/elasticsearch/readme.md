# https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html


demotest:
#salt 'linux-node2.example.com' state.sls elasticsearch.repo saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls elasticsearch.install saltenv='prod' -t 300
#salt 'linux-node2.example.com' state.sls elasticsearch.conf saltenv='prod' -t 300
failed salt 'linux-node2.example.com' state.sls elasticsearch.service saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls elasticsearch.stop saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls jdk.uninstall saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls elasticsearch.uninstall saltenv='prod' -t 300

