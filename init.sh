#!/bin/sh

rclone config create umstor s3 access_key_id ${UMSTOR_ACCESS_KEY} secret_access_key ${UMSTOR_SECRET_KEY} provider Ceph endpoint ${UMSTOR_ENDPOINT}
rclone config create alioss s3 access_key_id ${ALIOSS_ACCESS_KEY} secret_access_key ${ALIOSS_SECRET_KEY} provider Alibaba endpoint ${ALIOSS_ENDPOINT}

if [ -z "$FILE_PREFIX" ]; then
    FILE_PREFIX="*"
fi

if [ -z "$MIN_AGE" ]; then  
    MIN_AGE="1ms"
fi

rclone sync alioss://${ALIOSS_BUCKET} umstor://${UMSTOR_BUCKET} --include=${FILE_PREFIX} --min-age=${MIN_AGE} --progress
rclone check alioss://${ALIOSS_BUCKET} umstor://${UMSTOR_BUCKET}
