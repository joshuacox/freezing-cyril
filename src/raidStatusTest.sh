#!/bin/bash
# test for differences in raidstatus
# upon finding a difference email me with the results
#
# First you'll need to setup the defaults with these two lines:
# /usr/sbin/aacraid-status >/root/raiddefaultstatus
# /usr/sbin/arcconf getconfig 1 >> /root/raiddefaultstatus
# Then any diffs will be alerted to your email

# Then these are run every time to test for diffs
/usr/sbin/aacraid-status >/tmp/statustest
/usr/sbin/arcconf getconfig 1 >> /tmp/statustest

EMAIL=coopadmin@webhosting.coop
DIFF=$(diff /tmp/statustest /root/raiddefaultstatus )

if [ "$DIFF" != "" ]; then
    echo "yikes"
    printenv >> /tmp/statustest
    cat /tmp/statustest |mail -s "RAID ISSUE" $EMAIL
fi
rm /tmp/statustest
