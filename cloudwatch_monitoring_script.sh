#!/bin/bash
cd /root
yum install -y perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https perl-Digest-SHA curl zip unzip
curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O
unzip CloudWatchMonitoringScripts-1.2.2.zip
chown ${USER}:${USER} ./aws-scripts-mon
mv aws-scripts-mon /home/${USER}/
echo "*/1 * * * * /home/${USER}/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-avail --disk-path=/ --disk-space-util --disk-space-avail --memory-units=megabytes --disk-space-units=gigabytes --from-cron" >> /var/spool/cron/${USER}
chown ${USER}:${USER} /var/spool/cron/${USER}
