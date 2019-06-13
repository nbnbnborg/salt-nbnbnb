# general not use

include:
  - ius.yum-replace-install

"yum replace redis --replace-with redis5 -y":
  cmd.run:
    - require:
      - pkg: "yum-plugin-replace install"
