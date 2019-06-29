download_zabbix_packages: 
  cmd.run:
    - name: wget http://repo.zabbix.com/zabbix/3.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.4-1+bionic_all.deb -P /DL_files
    - package: dkpg -i zabbix-release_3.4-1+bionic_all.deb

install_zabbix_packages:
  cmd.run:
    - name: apt-get update
    - install: apt-get install zabbix-agent

configure_zabbix_agent:
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://zabbix_agentd.conf
    - makedirs: True
  cmd.run:
    - name: x="hostname"
    - replace: sed -i "149s/.*/Hostname=$x/" zabbix_agentd.conf
