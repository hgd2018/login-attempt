#Grant execute permission
chmod +x *.sh

#Install nginx package
echo -e "[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/mainline/centos/7/$basearch/\ngpgcheck=0\nenabled=1" \ > /etc/yum.repos.d/nginx.repo
yum -y install nginx

#Create nodes directory
mkdir /usr/share/nginx/html/nodes

#Set crontab to collect metrics every 2 minutes
echo "$(echo '*/2 * * * * ~/login-attempt/collect-metrics.sh'; crontab -l)" | crontab -

#Run collect metrics script
./collect-metrics.sh
