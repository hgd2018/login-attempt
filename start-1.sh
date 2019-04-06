#Grant execute permission
chmod +x *.sh

#Install nginx package
cp nginx.repo /etc/yum.repos.d/nginx.repo
yum -y install nginx
systemctl start nginx
systemctl enable nginx

#Create nodes directory
mkdir /usr/share/nginx/html/nodes

#Set crontab to collect metrics every 2 minutes
echo "$(echo '*/2 * * * * ~/login-attempt/collect-metrics.sh'; crontab -l)" | crontab -

#Run collect metrics script
./collect-metrics.sh
