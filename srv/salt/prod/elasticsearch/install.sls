include:
  - jdk.install
  - elasticsearch.repo

elasticsearch install:
  pkg.installed:
    - name: elasticsearch 
    - require:
      - file: "elasticsearch repo"

