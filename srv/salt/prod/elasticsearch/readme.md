# https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html

bigger than 7 not must install jdk. it has!

demotest:
#salt 'linux-node2.example.com' state.sls elasticsearch.repo saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls elasticsearch.install saltenv='prod' -t 300
#salt 'linux-node2.example.com' state.sls elasticsearch.conf saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls elasticsearch.service saltenv='prod' -t 300

[root@linux-node3 /etc/elasticsearch]# curl -X GET http://192.168.56.13:9200
{
  "name" : "linux-node3.example.com",
  "cluster_name" : "elasticsearch-demo",
  "cluster_uuid" : "nmJa8ZQgQEK4HAqTVwyXHA",
  "version" : {
    "number" : "7.1.1",
    "build_flavor" : "default",
    "build_type" : "rpm",
    "build_hash" : "7a013de",
    "build_date" : "2019-05-23T14:04:00.380842Z",
    "build_snapshot" : false,
    "lucene_version" : "8.0.0",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}

salt 'linux-node2.example.com' state.sls elasticsearch.stop saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls jdk.uninstall saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls elasticsearch.uninstall saltenv='prod' -t 300

