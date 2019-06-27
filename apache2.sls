install_apache2:
  pkg.installed:
      - name: apache2

service_apache2:
  service.running:
    - name: apache2
    - enable: True
    - require:
      - pkg: install_apache2
