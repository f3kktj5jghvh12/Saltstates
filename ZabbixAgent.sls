download_zabbix_packages: 
  cmd.run:
    - name: wget http://repo.zabbix.com/zabbix/3.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.4-1%2Bbionic_all.deb -P /DL_files

install_zabbix_packages:
  cmd.run:
    - name: dpkg -i zabbix-release_3.4-1+bionic_all.deb

configure_zabbix_agent:
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://zabbix_agentd.conf
    - makedirs: True
  cmd.run:
    - name: x="hostname"
    - replace: sed -i "149s/.*/Hostname=$x/" zabbix_agentd.conf
