include:
  - dir.sls

soft install:
  pkg.installed:
    - names:
      - soft
    - require:
      - mod: ID
