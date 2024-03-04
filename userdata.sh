#!/bin/bash
apt-get update -y
apt-get upgrade -y
apt-get install git -y
apt-get install python3 python3-pip python3-venv -y
apt-get install python3.8-dev default-libmysqlclient-dev -y
cd /home/ubuntu/
USER=${user-data-git-name}
TOKEN=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
git clone https://$TOKEN@github.com/$USER/DjangoBlogTerraform.git
python3 -m venv venv
source venv/bin/activate
cd /home/ubuntu/DjangoBlogTerraform/
pip3 install -r requirements.txt
cd /home/ubuntu/DjangoBlogTerraform/src
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:80