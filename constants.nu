#!/usr/bin/env nu

# colors 
let RED = 196
let GREEN = 40
let YELLOW = 226
let BLUE = 27
let MAGENTA = 198
let CYAN = 51
let PORT = 5555

# list of actions that can be performed on the connected device.
mut LIST_OF_ACTIONS_ON_DEVICE = [
    "Information",
    "Switch to wifi-adb",
    "Screenshot",
    "Reboot",
    "Power off",
    "Exit",
]