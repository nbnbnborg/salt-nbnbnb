replace /etc/profile:
  file.managed:
    - name: /etc/profile
    - source: salt://init/files/profile
    - user: root
    - group: root
    - mode: 644

change PS1:
  file.append: #GREEN - complex
    - name: /etc/profile
    - text:
      - export PS1='$(tput setaf 2)[\u@\h \w]# $(tput sgr0)'

change HISTTIMEFORMAT:
  file.append:
    - name: /etc/profile
    - text:
      - export HISTTIMEFORMAT="%F %T `whoami` "
