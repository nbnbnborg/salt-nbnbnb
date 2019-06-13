ori /etc/bashrc:
  file.managed:
    - name: /etc/bashrc
    - source: salt://init/files/bashrc
    - user: root
    - gourp: root
    - mode: 644

Record all user action records:
  file.append: #Linux中的PROMPT_COMMAND会记录下出现提示符前面的命令，利用这个特性可以实现记录所有用户的操作记录
    - name: /etc/bashrc
    - text:
      - export PROMPT_COMMAND='{ msg=$(history 1 | { read x y; echo $y; });logger "[euid=$(whoami)]":$(who am i):[`pwd`]"$msg"; }'
