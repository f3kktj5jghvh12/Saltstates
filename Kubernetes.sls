Curl:
  pkg.installed:
    - name: curl 

Download_Dependencies:
  cmd.run:
    - name: sudo apt-get -y --assume-yes update && sudo apt-get -y --assume-yes install apt-transport-https


Service_docker:
  service.running:
    - name: docker
    - enable: True

Kubernetes_keys:
  cmd.run:
    - name: curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
    - require:
      - pkg: Curl

Kubernetes_repository:
  cmd.run:
    - name: sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

Kubeadm:
  cmd.run:
    - name: sudo apt -y --assume-yes install kubeadm

Swap:
  cmd.run:
    - name: sudo swapoff -a

Kluster_join:
  cmd.run:
    - name: kubeadm join 10.2.3.16:6443 --token jyfkkq.nz4qmh0f1ob1wbb6 --discovery-token-ca-cert-hash sha256:595e936be7686f4b5f77d78e289771097df18c94462e46b6dd3e6cd51a672922 --ignore-preflight-errors all
