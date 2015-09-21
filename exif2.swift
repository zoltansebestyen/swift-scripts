import Foundation
import Cocoa
import CoreFoundation
import ImageIO

// let url = NSURL(string: "file:////Users/szoli/Desktop/kepek/to_be_archived/zolimobilaug12/IMG_0878.JPG")
// let path = "file:////Users/szoli/Desktop/kepek/to_be_archived/agicapture/2015-03-11 Kardok/IMG_2863.JPG"
// let url = NSURL(string: path)
// let url = NSURL(string: "file:////Users/szoli/Work/Swift/scripts/IMG_2863.JPG")

//let path:String = "/Users/szoli/Work/Swift/scripts/IMG_2863.JPG"
let path:String = "/Users/szoli/Desktop/kepek/to_be_archived/agicapture/2015-03-11 Kardok/IMG_2863.JPG"
let url = NSURL(fileURLWithPath: path)


var checkValidation = NSFileManager.defaultManager()

if (!checkValidation.fileExistsAtPath(path))
{
    print("FILE \(path) NOT AVAILABLE");
    exit(0)
}

let imageSource = CGImageSourceCreateWithURL(url, nil)
let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource!, 0, nil)! as Dictionary

print(imageProperties)
