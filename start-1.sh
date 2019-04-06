cd login-attempt
chmod +x *.sh

#Install nginx package
yum -y install nginx

#Create nodes directory
mkdir /usr/share/nginx/html/nodes

#Set crontab to collect metrics every 2 minutes
echo "$(echo '*/2 * * * * ~/login-attempt/collect-metrics.sh'; crontab -l)" | crontab -

./collect-metrics.sh
