include:
  - jenkins.stop

jenkins uninstall:
  cmd.run:
    - name: |
            rpm -e --nodeps jenkins && \
            find / -iname jenkins | xargs -n 1000 rm -rf
    - unless: test ${rpm -q jenkins} = 0
