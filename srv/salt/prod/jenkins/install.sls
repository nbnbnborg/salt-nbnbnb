include:
  - jdk.install
  - jenkins.repo

jenkins install:
  cmd.run:
    - name: yum install -y jenkins
    - require:
      - cmd: "jenkins yum"

# yum info jenkins is OK
# yum search jenkins is no xmldata.
# so only can use cmd to install jenkins.
# if use Cobbler to make xmldata is batter.

