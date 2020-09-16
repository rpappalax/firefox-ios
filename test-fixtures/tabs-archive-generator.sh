#!/bin/bash

SIM_NAME="iPhone-8Plus-tabsArchive" 
SIM_DEVICE_TYPE="com.apple.CoreSimulator.SimDeviceType.iPhone-8"
URLS="../Client/Assets/topdomains.txt"
PATH_TEST_FIXTURES="."
CMD="xcrun simctl openurl Booted firefox://open-url?url"
PATH_BUILD="~/Library/Developer/Xcode/DerivedData/Client-bzwhhlktnykxhyhhsfvznfqypqot/Build/Products/Fennec-iphonesimulator/Client.app"


function create_sim() {
    echo "CREATING DEVICE"
    DEVICE_ID=`xcrun simctl create ${SIM_NAME} ${SIM_DEVICE_TYPE}`
    echo "DEVICE_ID: ${DEVICE_ID}"
    DEVICE_PATH=~/Library/Developer/CoreSimulator/Devices/${DEVICE_ID}/data/Containers/
    echo "DEVICE_PATH: ${DEVICE_PATH}"
}

function destroy_sim() {
    echo "DESTROYING SIM"
    xcrun simctl delete ${SIM_DEVICE_ID} 
}

function boot_sim() {
    echo "BOOTING DEVICE"
    xcrun simctl boot ${DEVICE_ID}
}

function install_app() {
    echo "INSTALLING APP"
    xcrun simctl install ${DEVICE_ID} ${PATH_BUILD}
}

function copy_archive() {
    PATH_PROFILE=$(find ${DEVICE_PATH} . -type d -name "profile.profile")
    #cp ${PATH_PROFILE}/tabsState.archive ${PATH_TEST_FIXTURES}/tabsState999.archive
    cp ${PATH_PROFILE}/tabsState.archive ${PATH_PROFILE}/tabsState999.archive
}


create_sim
boot_sim
install_app

n=1
while read url; do
    echo "OPEN TAB: ${url}"
    eval $(xcrun simctl openurl Booted firefox://open-url?url=https://${url})
    n=$((n+1))
done < ${URLS}

copy_archive
#destroy_sim
