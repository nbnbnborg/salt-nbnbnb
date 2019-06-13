include:
  - ius.yum-replace-install

httpd install:
  pkg.installed:
    - pkgs:
      - httpd

"yum replace httpd":
  cmd.run:
    - names:
      - "yum replace httpd --replace-with httpd24u -y"

httpd24u install:
  pkg.installed:
    - pkgs:
      - httpd24u
      - httpd24u-tools
