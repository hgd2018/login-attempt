source ~/login-attempt/properties.env

a1f=`ssh ops@$ip_alpha1 cat /var/log/secure|grep "Failed password"|wc -l`
a1a=`ssh ops@$ip_alpha1 cat /var/log/secure|grep "Accepted password"|wc -l`
no=`expr $a1f + $a1a`
echo $no > /usr/share/nginx/html/nodes/$ip_alpha1.txt

a2f=`ssh ops@$ip_alpha2 cat /var/log/secure|grep "Failed password"|wc -l`
a2a=`ssh ops@$ip_alpha2 cat /var/log/secure|grep "Accepted password"|wc -l`
no=`expr $a2f + $a2a`
echo $no > /usr/share/nginx/html/nodes/$ip_alpha2.txt

echo "<html>" > /usr/share/nginx/html/metrics.html
echo "<head>" >> /usr/share/nginx/html/metrics.html
echo "<style>" >> /usr/share/nginx/html/metrics.html
echo "table {" >> /usr/share/nginx/html/metrics.html
echo "  border-collapse: collapse;" >> /usr/share/nginx/html/metrics.html
echo "  width: 20%;" >> /usr/share/nginx/html/metrics.html
echo "}" >> /usr/share/nginx/html/metrics.html

echo "th, td {" >> /usr/share/nginx/html/metrics.html
echo "  text-align: left;" >> /usr/share/nginx/html/metrics.html
echo "  padding: 8px;" >> /usr/share/nginx/html/metrics.html
echo "}" >> /usr/share/nginx/html/metrics.html

echo "tr:nth-child(even) {background-color: #f2f2f2;}" >> /usr/share/nginx/html/metrics.html
echo "</style>" >> /usr/share/nginx/html/metrics.html
echo "</head>" >> /usr/share/nginx/html/metrics.html
echo "<title>Metrics SSH attempt login</title>" >> /usr/share/nginx/html/metrics.html
echo "<body>" >> /usr/share/nginx/html/metrics.html
echo "<table>" >> /usr/share/nginx/html/metrics.html
echo "<tr>" >> /usr/share/nginx/html/metrics.html
echo "<th>Metrics for ssh log-ins attempts</th>" >> /usr/share/nginx/html/metrics.html
echo "</tr>" >> /usr/share/nginx/html/metrics.html

cd /usr/share/nginx/html
files=`ls nodes`
for no in ${files[*]}
do
   host=`echo "$no" | cut -f 1-4 -d "."`
   att=`cat nodes/$no`
   echo "<tr><td>* node"$host "had " $att "attempt</td></tr>" >> /usr/share/nginx/html/metrics.html
done

echo "</table>" >> /usr/share/nginx/html/metrics.html
echo "<body>" >> /usr/share/nginx/html/metrics.html
echo "</html>" >> /usr/share/nginx/html/metrics.html
