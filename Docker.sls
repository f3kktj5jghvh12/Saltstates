download_docker_packages:
  cmd.run:
    - name: sudo wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_18.09.7~3-0~ubuntu-bionic_amd64.deb -P /DL_files
    - package: sudo dkpg -i docker-ce_18.09.7~3-0~ubuntu-bionic_amd64.deb

install_docker_packages:
  cmd.run:
    - name: sudo apt-get -y --assume-yes install docker-ce
    
service_Docker:
  service.running:
    - name: docker
    - enable: True

Enable_Docker:
  cmd.run:
    - name: sudo systemctl enable docker
    - unmask: sudo systemctl unmask docker.service
