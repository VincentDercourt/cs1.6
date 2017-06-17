#!/bin/bash

if [ ! -f "csserver" ]; then
    wget https://gameservermanagers.com/dl/csserver
    chmod +x csserver
fi
if [ ! -d "serverfiles" ]; then
    yes Y | ./csserver install
    for i in 10 70; do wget -q https://raw.githubusercontent.com/Arkshine/hlds-appmanifest/master/appmanifest_$i.acf -O appmanifest_$i.acf; mv appmanifest_$i.acf serverfiles/steamapps/appmanifest_$i.acf; done
    yes Y | ./csserver install
fi

yes Y | ./csserver update

yes Y | ./csserver start

/bin/bash