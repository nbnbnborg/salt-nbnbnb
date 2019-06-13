soft uninstall:
  pkg.removed:
    - names:
      - wordpress
      # requires
      - mod_php72u
      - php72u-intl
      - php-IDNA_Convert
      - php-PHPMailer
      - php-fedora-autoloader
      - php-getid3
      - php-simplepie
