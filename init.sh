#!/bin/sh

rclone config create umstor s3 access_key_id ${UMSTOR_ACCESS_KEY} secret_access_key ${UMSTOR_SECRET_KEY} provider Ceph endpoint ${UMSTOR_ENDPOINT}
rclone config create alioss s3 access_key_id ${ALIOSS_ACCESS_KEY} secret_access_key ${ALIOSS_SECRET_KEY} provider Alibaba endpoint ${ALIOSS_ENDPOINT}
rclone sync alioss:/${ALIOSS_BUCKET} umstor:/${UMSTOR_BUCKET} --progress
rclone check alioss:/${ALIOSS_BUCKET} umstor:/${UMSTOR_BUCKET}
