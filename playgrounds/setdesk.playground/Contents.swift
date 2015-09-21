//: Playground - noun: a place where people can play

import Cocoa

import Cocoa
import AppKit

var imgurl : NSURL = NSURL.fileURLWithPath("/Users/szoli/Work/Swift/scripts/apa2.jpg")
var error : NSError?
var workspace = NSWorkspace.sharedWorkspace()
var screen = NSScreen.mainScreen()

do {
    try workspace.setDesktopImageURL(imgurl, forScreen: screen!, options: [NSWorkspaceDesktopImageAllowClippingKey: true])
    print("Wallpaper set!")
} catch let error as NSError {
    print("Could not set wallpaper");
    print("Error: \(error.localizedDescription)")
}
