java-1.8.0-openjdk uninstall:
  pkg.removed:
    - pkgs:
      - java-1.8.0-openjdk
      - java-1.8.0-openjdk-devel
      - java-1.8.0-openjdk-headless
    #- unless: test ${rpm -q java-1.8.0-openjdk} =1

java-11-openjdk install:
  pkg.removed:
    - pkgs:
      - java-11-openjdk
      - java-11-openjdk-devel
      - java-11-openjdk-headless
    - unless: test ${rpm -q java-11-openjdk} =1
