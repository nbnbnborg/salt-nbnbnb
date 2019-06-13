include:
  - docker.repo

docker-ce install:
  pkg.installed:
    - names:
      - docker-ce
    - require:
      - file: "docker-ce repo"
