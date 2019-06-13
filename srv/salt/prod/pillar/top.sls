prod:
#  'lvs':
#    - lvs.loadblance
#  'web-*':
#    - lvs.realserver

  'linux-node(2|3).example.com':
    - match: pcre
    - keepalived
    - haproxy
