#!/usr/bin/env nu

source constants.nu

def pprint [input, color = 40] {
    gum style --foreground $color $input
}

def header [input, color = 40] {
    gum style --foreground $color --border-foreground $color --border normal --align center --width 100 --margin "2 2" --padding "1 1" $input
}

def confirmPrompt [message: string] {
    try { 
    gum confirm $message
    return true
    } catch { 
    return false
    }

}

def spin [action] {
    gum spin --show-output --spinner moon --title "Taking screenshot, Please wait..." -- $action
}