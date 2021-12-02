#!/bin/bash
# take the scripts's parent's directory to prefix all the output paths.
RUN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $RUN_DIR
# download modified festcat dataset
wget http://laklak.eu/share/upc_ona_data.tar.gz
wget http://laklak.eu/share/upc_pau_data.tar.gz
# change the data format to ljspeech
mkdir -p $RUN_DIR/festcat_data
mkdir -p $RUN_DIR/festcat_data/ona
mkdir -p $RUN_DIR/festcat_data/pau
tar -xzf upc_ona_data.tar.gz -C $RUN_DIR/festcat_data
tar -xzf upc_pau_data.tar.gz -C $RUN_DIR/festcat_data
mv $RUN_DIR/festcat_data/adaptation_ona_full_wav $RUN_DIR/festcat_data/ona/wavs
mv $RUN_DIR/festcat_data/adaptation_pau_full_wav $RUN_DIR/festcat_data/pau/wavs
# ona data convert
cat $RUN_DIR/festcat_data/upc_ona*.txt > dummy
sed 's|/content/adaptation_ona_wav/||g; s/.wav|/||/g;' dummy > $RUN_DIR/festcat_data/ona/metadata_ona.csv
# pau data convert
cat $RUN_DIR/festcat_data/upc_pau*.txt > dummy
sed 's|/content/adaptation_pau_wav/||g; s/.wav|/||/g;' dummy > $RUN_DIR/festcat_data/pau/metadata_pau.csv
# cleaning
rm dummy $RUN_DIR/festcat_data/upc_ona*.txt upc_ona_data.tar.gz $RUN_DIR/festcat_data/upc_pau*.txt upc_pau_data.tar.gz
