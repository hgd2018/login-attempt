# login-attempt

Pre-requisite steps:

Create user ops in alpha client server
1. Login to alpha client server and create new user
   useradd ops; echo password | passwd your-service-user --stdin
2. grant read permission for log file
   chmod 604 /var/log/secure
3. Rerun above command to another alpha client server

Create passwordless login from alpha server to alpha clients
1. Login to alpha server as root and create SSH passwordless login
  a. ssh-keygen
  b. ssh-copy-id -i ~/.ssh/id_rsa.pub ops@ip_address
Notes: change ip_address variable with your alpha client ip address
2. Rerun the step b and change the second alpha client ip address

Deployment steps:
1. Login at alpha server as root
2. Install git package
   yum -y install git
3. Pull the repo
   git clone https://github.com/hgd2018/login-attempt.git 
4. Execute the script start-1.sh
   cd login-attempt
   sh ./start-1.sh

Notes:
Crontab runs every 2 minutes to collect login-attempt metrics
