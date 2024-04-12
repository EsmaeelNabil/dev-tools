#!/usr/bin/env nu

source constants.nu
source gum-utils.nu


def install [] {
#  make sure brew, fzf, adb , gum are installed
    if (confirmPrompt "Do you want to install the required dependencies?") {
        pprint "Installing dependencies..."
        gum spin --show-output --spinner moon --title "brew install fzf" -- brew install fzf
        gum spin --show-output --spinner moon --title "android-platform-tools" -- brew install android-platform-tools
        gum spin --show-output --spinner moon --title "brew install gum" -- brew install gum
    }
}

def get_device_info [device] {
    # ask if the user wants to search for a specific property    
    if (confirmPrompt "Do you want all the Information") {
        adb -s $device shell getprop | fzf
    } else {
        adb -s $device shell getprop | grep -E 'ro\.build|ro\.product\.model|ro\.product\.brand' | each { pprint $in $CYAN }
    }
}

def switch_to_wifi_adb [device, ip_address] {
    pprint "Switching adb to wifi..." $YELLOW
    adb -s $device tcpip $PORT
    adb connect $"($ip_address):($PORT)"
}

def adb_devices [] {
    adb devices
}

def newLine [] {
    echo "\n"
}

def reboot_device [device] {
    if (confirmPrompt "Are you sure you want to reboot the device?") {
        adb -s $device reboot
    }
}

def power_off_device [device] {
    if (confirmPrompt "Are you sure you want to power off the device?") {
        adb -s $device shell reboot -p
    }
}

def exit_program [] {
    pprint "Exiting..." $MAGENTA
    exit 0
}

# take a screenshot of the device and copy it to the desktop
def take_screenshot [device] {
    let date = (date now | format date "%Y_%m_%d_%H_%M_%S") | to text
    gum spin --show-output --spinner moon --title "Taking screenshot, Please wait..." -- ./bash.sh $device $date
}

