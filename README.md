# HDP-Cluster
HDP 2.3 4 node Cluster installation by using Docker

Approach:

1. Create Ubuntu machine on Virtual Box with 8 GB RAM
2. Spin up Docker with 4 nodes
3. Download repo files
4. Install Ambari server
5. Install Hadoop Cluster  

Step 1: Get operational_management_2.0_VM.zip from Hortonworks Operations training material.

Step 2: Do SSH to all 4 nodes (node1, node2, node3 and node4)

Step 3: Setting up the Environment

On Ubuntu:
```
git clone https://github.com/mcapavan/HDP-Cluster.git
scp -r HDP-Cluster/* root@node1:~/Downloads/
ssh node1
chmod 777 ~/Downloads/scripts/*
cp ~/Downloads/scripts/distFile.sh ~/scripts
~/Downloads/scripts/env_setup.sh

yum install ambari-server
ambari-server setup
ambari-server start
ambari-server status
```
Make sure you select Java 8 when you install Ambari
