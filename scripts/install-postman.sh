#!/bin/bash

wget -c https://dl.pstmn.io/download/latest/linux -O postman.tar.gz

tar zxvf postman.tar.gz

sudo mv Postman /opt

sudo ln -s /opt/Postman/Postman /usr/local/bin/postman

