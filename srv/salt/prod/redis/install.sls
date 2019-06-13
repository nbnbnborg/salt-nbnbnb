include:
  - ius.yum-replace-install

redis5-install:
  pkg.installed:
   - name: redis5
   - require:
     - pkg: "yum-plugin-replace install"
     # if installed redis3.2 well use:
     #- cmd: "yum replace redis --replace-with redis5 -y"
