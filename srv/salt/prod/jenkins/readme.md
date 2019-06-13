# description



demotest:
salt 'linux-node2.example.com' state.sls jenkins.repo saltenv='prod' -t 400
salt 'linux-node2.example.com' state.sls jenkins.install saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls jenkins.conf saltenv='prod' -t 30
salt 'linux-node2.example.com' state.sls jenkins.service saltenv='prod' -t 30
salt 'linux-node2.example.com' cmd.run 'cat /var/lib/jenkins/secrets/initialAdminPassword' -t 30
#look http://192.168.56.12:8081/pluginManager/advanced at https://updates.jenkins.io/update-center.json
salt 'linux-node2.example.com' state.sls jenkins.stop saltenv='prod' -t 30
salt 'linux-node2.example.com' state.sls jenkins.uninstall saltenv='prod' -t 30
salt 'linux-node2.example.com' state.sls jdk.uninstall saltenv='prod' -t 300

xt-cicd-jenkins-01.nbnbnb.org 8G 4CPU:
salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls gitlab.install saltenv='prod' -t 300
salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls gitlab.conf saltenv='prod' -t 30
salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls gitlab.service saltenv='prod' -t 300


salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls jenkins.repo saltenv='prod' -t 400
salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls jenkins.install saltenv='prod' -t 300
salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls jenkins.conf saltenv='prod' -t 30

salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls jenkins.service saltenv='prod' -t 30

# wait 1 mintues
# sed 's/\("connectionCheckUrl":"\).*/\1https:\/\/www.baidu.com"/g' /var/lib/jenkins/updates/default.json
#salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls jenkins.conf saltenv='prod' -t 30
#salt 'xt-cicd-jenkins-01.nbnbnb.org' cmd.run 'systemctl restart jenkins' -t 30
vim /var/lib/jenkins/updates/default.json
vim /var/lib/jenkins/hudson.model.UpdateCenter.xml 
#把<url>https://updates.jenkins.io/update-center.json</url>改成<url>http://updates.jenkins.io/update-center.json</url> 

salt 'xt-cicd-jenkins-01.nbnbnb.org' cmd.run 'cat /var/lib/jenkins/secrets/initialAdminPassword' -t 30
#look http://xt-cicd-jenkins-01.nbnbnb.org:8081/pluginManager/advanced at https://updates.jenkins.io/update-center.json

由于使用非8080端口，安装插件后，页面为空白，需要重启
systemctl restart jenkins

salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls jenkins.stop saltenv='prod' -t 30
salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls jenkins.uninstall saltenv='prod' -t 30
salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls jdk.uninstall saltenv='prod' -t 300

salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls gitlab.backups saltenv='prod' -t 300
# look doc to restore.
#salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls gitlab.restore saltenv='prod' -t 300
salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls gitlab.stop saltenv='prod' -t 300
salt 'xt-cicd-jenkins-01.nbnbnb.org' state.sls gitlab.uninstall saltenv='prod' -t 200
