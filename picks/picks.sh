#!/bin/bash
set -e
source build/envsetup.sh

# frameworks/opt/telephony
echo "[ 0% 0/4] pick topic 'ten-qc-telephony-fix'"
repopick -c 20 -t ten-qc-telephony-fix
echo "[ 20% 1/4] pick 'SimPhoneBook: Add ANR/EMAIL support for USIM phonebook.'"
repopick 265322

# packages/services/Telephony
echo "[ 40% 2/4] pick 'Don't start SIP service before decrypted'"
repopick 256795

# device/qcom/sepolicy
echo "[ 60% 3/4] pick 'Remove sysfs_disk_stat labels'"
repopick 261511
echo "[ 100% 4/4] exit 0"
