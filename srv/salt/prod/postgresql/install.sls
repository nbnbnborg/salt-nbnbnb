include:
  - postgresql.repo

postgresql install:
  pkg.installed:
    - names:
      - postgresql11
      - postgresql11-server
      # other:
      - postgresql11-contrib
      - postgresql11-devel
      - postgresql11-libs
      - postgresql11-llvmjit
      - postgresql11-odbc
      - postgresql11-plperl
      - postgresql11-plpython
      - postgresql11-pltcl
      - postgresql11-tcl
      - postgresql11-test
    - require:
      - file: "postgresql repo"
