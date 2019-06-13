# description

demotest:
salt 'linux-node2.example.com' state.sls ansible.install saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls ansible.conf saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls ansible.uninstall saltenv='prod' -t 300
