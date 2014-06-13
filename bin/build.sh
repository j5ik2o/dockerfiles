#!/bin/sh

. ./env.sh

sudo docker build --no-cache=true -t $NAME .

reimport() {
  CID=$(sudo docker run -d $NAME /bin/bash -c "")
  sudo docker export $CID > tmp.tar
  sudo docker kill $CID
  cat tmp.tar | sudo docker import - base
  rm -f tmp.tar
}

#reimport
