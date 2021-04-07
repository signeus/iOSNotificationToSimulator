#!/bin/sh

NOTIFICATION_FILE="example.apns"
BUNDLE_ID="app.example.com"

echo "Looking for the booted device"
DEVICE_BOOTED=$(xcrun simctl list devices | grep "(Booted)" | grep -E -o -i "([0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12})")
echo "We detected the booted device $DEVICE_BOOTED"

echo "Sending a notification to Booted deviced"
xcrun simctl push $DEVICE_BOOTED $BUNDLE_ID $NOTIFICATION_FILE

echo "Sent to $DEVICE_BOOTED/$BUNDLE_ID, check the device"
exit
