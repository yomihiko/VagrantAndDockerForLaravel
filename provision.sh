sudo su


PROJECTNAME="SampleProject" # Laravel Project Name


yum -y install docker
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload
systemctl start docker
systemctl enable docker
curl -L https://github.com/docker/compose/releases/download/1.25.0-rc4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
export PATH=$PATH:/usr/local/bin
cd /home/vagrant/data
docker-compose build
docker-compose up -d
docker container exec -u laravel data_web_1 composer create-project --prefer-dist laravel/laravel $PROJECTNAME