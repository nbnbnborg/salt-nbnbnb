0.pre:
  yum-replace-php

1.install:
  At first,please run yum-replace-php.sls once use hand,
  Than,run install.sls.

2.conf:
  conf.sls

3.service:
  can not direct to run it,need order.

4.stop:
  stop.sls

5.uninstall:
  uninstall.sls

testdemo:
salt 'linux-node2.example.com' state.sls php.yum-replace-php saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls php.install saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls php.conf saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls php.service saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls php.stop saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls php.uninstall saltenv='prod' -t 300

other:
  in the future,adaptation make install & php plugin(memcache,redis)

