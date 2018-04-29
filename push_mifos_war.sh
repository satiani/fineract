SCRIPT_ROOT=$(cd `dirname $0` && pwd)

rsync -avz -e "ssh -i ~/.ssh/newbery-aws.pem -p 2222" $SCRIPT_ROOT/build/libs/fineract-provider.war admin@127.0.0.1:~/code/incubator-fineract/build/libs/fineract-provider.war 
ssh -i ~/.ssh/newbery-aws.pem -p 2222 admin@127.0.0.1 bash <<EOF
sudo systemctl stop tomcat
sudo -u tomcat rm -Rf /usr/share/tomcat7/webapps/fineract-provider
sudo -u tomcat cp ~/code/incubator-fineract/build/libs/fineract-provider.war /usr/share/tomcat7/webapps
sudo systemctl start tomcat
sudo -u tomcat bash -c 'tail -f /usr/share/tomcat7/logs/*'
EOF
