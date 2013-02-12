#!/bin/bash

ROOT=/store/FIRE/data
YEAR=`date +%Y`

if [ ! -d $ROOT/$YEAR ]; then
    mkdir -p $ROOT/$YEAR
fi

OUTFILE=$ROOT/$YEAR/http_Russia_and_Asia_24h-`date +%Y-%m-%d-%H`.csv
URL='http://firms.modaps.eosdis.nasa.gov/active_fire/text/Russia_and_Asia_24h.csv'
wget -q --output-document=$OUTFILE $URL

OUTFILE=$ROOT/$YEAR/http_Russia_and_Asia_48h-`date +%Y-%m-%d-%H`.csv
URL='http://firms.modaps.eosdis.nasa.gov/active_fire/text/Russia_and_Asia_48h.csv'
wget -q --output-document=$OUTFILE $URL

OUTFILE=$ROOT/$YEAR/http_Russia_and_Asia_7d-`date +%Y-%m-%d-%H`.csv
URL='http://firms.modaps.eosdis.nasa.gov/active_fire/text/Russia_and_Asia_7d.csv'
wget -q --output-document=$OUTFILE $URL
