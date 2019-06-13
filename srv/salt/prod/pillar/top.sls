prod:
#  'lvs':
#    - lvs.loadbalance
#  'web-*':
#    - lvs.realserver

  'linux-node(2|3).example.com':
    - match: pcre
    - keepalived
    - haproxy

  'linux-node(1|2|3).example.com':
    - match: pcre
    - lvs.loadbalance
    - lvs.realserver
