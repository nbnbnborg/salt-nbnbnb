include:
  - ius.yum-replace-install

"yum replace php-common --replace-with php72u-common -y":
  cmd.run:
    - require:
      - pkg: "yum-plugin-replace install"
    - unless: test ${rpm -q php-common} = 1
