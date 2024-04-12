#!/usr/bin/env nu

source utils.nu
install

clear

header "Dev Tools"


# list of connected devices.
let SELECTED_DEVICE = adb_devices
| lines # split the output into lines.
| skip 1 # skip the first line which is the header "List of devices attached".
| drop 1 # drop the last empty line.
| each { |line| $line | split row "\t" | get 0 }  # get the first column of the row .
| to text # convert the list to text to be able to use it in the gum choose function.
| gum choose # show the list of devices and let the user choose one of them.


# get the connected device's ip address
let IP_ADDRESS = adb -s $SELECTED_DEVICE shell ip -f inet addr show wlan0 
    | grep "inet " 
    | awk '{print $2}' # 192.168.0.88/24
    | split row "/" # create a list with two elements"
    | get 0 # get the first row


if $IP_ADDRESS == "" {
    pprint "The selected device is not connected to wifi, please connect the device to the internet if you want to switch adb to wifi." $CYAN
    # remove the switch to wifi action from the list of actions.
    $LIST_OF_ACTIONS_ON_DEVICE = ($LIST_OF_ACTIONS_ON_DEVICE | skip 1)
}

let CHOICE = $LIST_OF_ACTIONS_ON_DEVICE | to text | gum choose


# based on the user's choice, call separate functions to perform the actions
match $CHOICE {
    "Information"  => {
        get_device_info $SELECTED_DEVICE
    }
    "Switch to wifi-adb" => {
        switch_to_wifi_adb $SELECTED_DEVICE $IP_ADDRESS
    }
    
    "Reboot" => {
        reboot_device $SELECTED_DEVICE
    }
    
    "Power off" => {
        power_off_device $SELECTED_DEVICE
    }

    "Screenshot" => {
        take_screenshot $SELECTED_DEVICE
    }

    "Exit" => {
        exit_program
    }
}



# add functionality to change screen density
# add functionality to change screen size
# add functionality to reset screen size and denisty and to take them as inputs
# Take a screen shot, delete it or copy the file.
# if the being powered off is emulator, kill it's process
