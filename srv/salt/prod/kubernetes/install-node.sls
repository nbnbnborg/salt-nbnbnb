kubeadm join:
  cmd.run:
    - name: |
            kubeadm join 192.168.56.237:6443 \
             --token lr9cp0.iq3ctf00dwtm0xhu \
             --discovery-token-ca-cert-hash \
               sha256:b4beef029e1d8b41246d695f2b8ce8e047582a4144134279f87b5bdeb57ddbdc

