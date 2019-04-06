# login-attempt

**Pre-requisite steps:**

### Create user ops in alpha client server
1. Login to alpha client server and create new user  <br />
  > useradd ops; echo password | passwd ops --stdin <br />
2. grant read permission for log file <br />
  > chmod 604 /var/log/secure <br />
3. Rerun above command to another alpha client server <br />

### Create passwordless login from alpha server to alpha clients
1. Login to alpha server as root and create SSH passwordless login <br />
  a. ssh-keygen <br />
  b. ssh-copy-id -i ~/.ssh/id_rsa.pub ops@ip_address <br />
##### Notes: change ip_address variable with your alpha client ip address <br />
2. Rerun the step b and change the second alpha client ip address <br />

### Deployment steps:
1. Login at alpha server as root <br />
2. Install git package <br />
   > yum -y install git <br />
3. Pull the repo <br />
   > git clone https://github.com/hgd2018/login-attempt.git  <br />
4. Change the properties.env file with your destination alpha client ip address
   > ip_alpha1=ip_address <br />
     ip_alpha2=ip_address
5. Execute the script start-1.sh <br />
   > cd login-attempt <br />
   > sh ./start-1.sh <br />

##### Notes: <br />
Crontab runs every 2 minutes to collect login-attempt metrics
