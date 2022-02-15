#!/bin/bash
# take the scripts's parent's directory to prefix all the output paths.
RUN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $RUN_DIR
# download fraza del dia dataset
wget http://collectivat.cat/share/fraza_dataset.tar.gz
# change the data format to ljspeech
tar -xzf fraza_dataset.tar.gz
# cleaning
rm dummy fraza_dataset.tar.gz
