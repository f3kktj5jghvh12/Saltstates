install_apache2:
  pkg.installed: [] 
  service.running:
    - require:
      - pkg: apache2

