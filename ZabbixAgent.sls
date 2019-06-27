download_zabbix_packages: 
  cmd.run:
    - name: wget http://repo.zabbix.com/zabbix/3.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.4-1%2Bbionic_all.deb -P /DL_files

install_zabbix_packages:
  cmd.run:
    - name: dpkg -i zabbix-release_3.4-1+bionic_all.deb
