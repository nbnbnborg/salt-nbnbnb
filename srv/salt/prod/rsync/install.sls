rsync install:
  pkg.installed:
    - pkgs:
      - rsync
      - inotify-tools
   # - require: "base & EPEL repo"
  
