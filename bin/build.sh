#!/bin/sh

. ./env.sh

docker build -t "j5ik2o/$NAME" .

reimport() {
  CID=$(sudo docker run -d $NAME /bin/bash -c "")
  docker export $CID > tmp.tar
  docker kill $CID
  cat tmp.tar | sudo docker import - base
  rm -f tmp.tar
}

#reimport
