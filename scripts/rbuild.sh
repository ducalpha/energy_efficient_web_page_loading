#!/bin/bash
. build/android/envsetup.sh
export CHROMIUM_OUT_DIR=out
CMD="ninja -C $CHROMIUM_OUT_DIR/Release content_shell_apk"

[[ "$#" -eq 1 ]] && [[ $1 == "install" ]] && \
CMD=$CMD" && adb install -r $CHROMIUM_OUT_DIR/Release/apks/ContentShell.apk && \
adb shell am force-stop org.chromium.content_shell_apk && \
adb shell am start -n org.chromium.content_shell_apk/.ContentShellActivity"

eval $CMD
