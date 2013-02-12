#!/bin/bash -x

ROOT=/store/FIRE/data
USER='groundbeat'
PASSWORD='#H1pH0pSh1t'
ACCESS_METHOD='ftp'
HOST='nrt1.modaps.eosdis.nasa.gov'
DATA_TYPE_ID='MCD14DL'
REGION='Russia_Asia'
P_OUTFILE="${ACCESS_METHOD}_${REGION}"
HOUR_DATE=$(date +%Y-%m-%d-%H)
YEAR=${HOUR_DATE%%-*}
E_OUTFILE='csv'

OUTFILE="${ROOT}/${YEAR}/${P_OUTFILE}-${HOUR_DATE}.${E_OUTFILE}"
URL="${ACCESS_METHOD}://${HOST}/FIRMS/${REGION}/${REGION}_${DATA_TYPE_ID}_$(date +%Y%j).txt"

mkdir -p "$ROOT/$YEAR"
if wget -q --user=$USER --password=$PASSWORD --output-document=$OUTFILE $URL; then
# rm -f "$ROOT/$YEAR/${P_OUTFILE}-${HOUR_DATE%-*}.${E_OUTFILE}" && \
#  ln -s "${P_OUTFILE}-${HOUR_DATE}.${E_OUTFILE}" "$ROOT/$YEAR/${P_OUTFILE}-${HOUR_DATE%-*}.${E_OUTFILE}"
 rm -f "$ROOT/24h.${E_OUTFILE}" && \
  ln -s "$YEAR/${P_OUTFILE}-${HOUR_DATE}.${E_OUTFILE}" "$ROOT/24h.${E_OUTFILE}"
fi
