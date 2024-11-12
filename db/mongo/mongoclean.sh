#!/bin/bash

cd /backup/dbbackup;
oldestfile=$(ls -rt1 |  head -n 1);
echo $oldestfile >> /backup/dbbackup/filedeleted;
echo "" >> /backup/dbbackup/filedeleted;
rm $oldestfile;
