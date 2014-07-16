#!/bin/bash
PWD=`pwd`
WORK_DIR=$PWD/work
UNSIGNED_ZIP=$PWD/update.unsigned.zip
SIGNED_ZIP=$PWD/update.zip
SIGNAPK_JAR=$PWD/signapk.jar
KEY_PEM=$PWD/testkey.x509.pem
KEY_PK8=$PWD/testkey.pk8

echo "removing update.zip"
rm -f $UNSIGNED_ZIP
rm -f $SIGNED_ZIP

echo "zipping work dir"
cd $WORK_DIR
zip -qry $UNSIGNED_ZIP ./

echo "sign update.zip"
cd $PWD
java -Xmx512m -jar $SIGNAPK_JAR -w $KEY_PEM $KEY_PK8 $UNSIGNED_ZIP $SIGNED_ZIP

echo "done!"