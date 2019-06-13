salt-call --local state.sls saltstack.service --file-root=/srv/salt/prod --pillar-root=/srv/salt/prod/pillar 
#--states-dir=/srv/salt/prod/saltstack

# salt-minion:
#rm -rf /etc/salt/minion_id && systemctl restart salt-minion

# salt-master:
# salt-key -A -y
# salt-key -L
