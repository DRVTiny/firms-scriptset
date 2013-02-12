#!/bin/bash

ROOT=/store/FIRE/data
YEAR=`date +%Y`

if [ ! -d $ROOT/$YEAR ]; then
    mkdir -p $ROOT/$YEAR
fi

USER='groundbeat'
PASSWORD='#H1pH0pSh1t'
OUTFILE=$ROOT/$YEAR/ftp_Russia_Asia-`date +%Y-%m-%d-%H`.csv
URL='ftp://nrt1.modaps.eosdis.nasa.gov/FIRMS/Russia_Asia/Russia_Asia_MCD14DL_'`date +%Y%j`'.txt'
wget -q --user=$USER --password=$PASSWORD --output-document=$OUTFILE $URL
