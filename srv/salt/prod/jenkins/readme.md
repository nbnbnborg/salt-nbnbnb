# description



demotest:
salt 'linux-node2.example.com' state.sls jenkins.repo saltenv='prod' -t 30
salt 'linux-node2.example.com' state.sls jenkins.install saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls jenkins.conf saltenv='prod' -t 30
salt 'linux-node2.example.com' state.sls jenkins.service saltenv='prod' -t 30
salt 'linux-node2.example.com' cmd.run 'cat /var/lib/jenkins/secrets/initialAdminPassword' -t 30
#look http://192.168.56.12:8081/pluginManager/advanced at https://updates.jenkins.io/update-center.json
salt 'linux-node2.example.com' state.sls jenkins.stop saltenv='prod' -t 30
salt 'linux-node2.example.com' state.sls jenkins.uninstall saltenv='prod' -t 30
