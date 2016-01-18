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
scp HDP-Cluster/files/*.* root@node1:~/
ssh node1
mv *.repo ~/conf
cd ~/scripts
chmod 777 *.sh
mkdir ~/Downloads/repo
cd ~/Downloads/repo
wget http://public-repo-1.hortonworks.com/HDP-UTILS-1.1.0.20/repos/centos6/HDP-UTILS-1.1.0.20-centos6.tar.gz
wget http://public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.3.0.0/HDP-2.3.0.0-centos6-rpm.tar.gz
wget http://public-repo-1.hortonworks.com/ambari/centos6/ambari-2.1.0-centos6.tar.gz


```
