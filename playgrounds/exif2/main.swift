//
//  main.swift
//  exif2
//
//  Created by Zoltán Sebestyén on 2015. 09. 20..
//  Copyright © 2015. Memph Inc. All rights reserved.
//
// Function: emulate the following:
//for i in ./*.JPG ./*.jpg
//do
//# echo file: $i
//DIRNAME=./$(identify -format "%[EXIF:DateTime]" "$i" |sed -e "s/\(....\):\(..\):\(..\).*/\1-\2-\3/")
//# echo DIR: $DIRNAME
//if [ ! -d $DIRNAME ]
//then
//mkdir $DIRNAME
//fi
//# echo mv $i $DIRNAME
//mv "$i" $DIRNAME
//done

import Foundation
import Cocoa
import CoreFoundation
import ImageIO

// Taken from http://stackoverflow.com/questions/24089999/how-do-you-create-a-swift-date-object

let dateStringFormatter = NSDateFormatter()
dateStringFormatter.dateFormat = "yyyy-MM-dd"
dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")

// took it out for performance.
let dateTimeStringFormatter = NSDateFormatter()
dateTimeStringFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
dateTimeStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")

extension NSDate
{
    convenience
    init(dateString:String) {
        // let dateString = "2015:03:11 19:22:14";
        let d = dateTimeStringFormatter.dateFromString(dateString)
        self.init(timeInterval:0, sinceDate:d!)
    }
}

let fm = NSFileManager.defaultManager()
guard let cwdEnum = fm.enumeratorAtPath( fm.currentDirectoryPath) else {
    print ("Can't walk current dir")
    exit (-1)
}

func printDate(date: String) {
    print(NSDate(dateString: date))
}

// TODO https://github.com/nori0620/SwiftFilePath could help
// or https://github.com/kylef/PathKit/blob/master/PathKit/PathKit.swift
while let element:String = cwdEnum.nextObject() as? String {
    if (element.lowercaseString.hasSuffix("jpg")) {
        let path = fm.currentDirectoryPath + "/" + element
        let url = NSURL(fileURLWithPath: path)
        
        guard let imageSource = CGImageSourceCreateWithURL(url, nil) else {
            print("Can't create image source for file \(path)")
            continue
//            exit(-1)
        }
        let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil)! as Dictionary

        guard let dateStr:String = (imageProperties["{TIFF}"]?["DateTime"] as? String) ??
            (imageProperties["{Exif}"]?["DateTimeDigitized"] as? String) ??
            (imageProperties["{Exif}"]?["DateTimeOriginal"] as? String) else {
                print("Can't get date for file \(path)")
            continue
        }

//        let dates = imageProperties["{GPS}"]!["DateStamp"] as! String
//        let times = imageProperties["{GPS}"]!["TimeStamp"] as! String
//        printDate("\(dates) \(times)")

        let date = NSDate(dateString: dateStr)
        let dirname = dateStringFormatter.stringFromDate(date)
        var dir:ObjCBool = true

        // Exists?
        if(!fm.fileExistsAtPath(dirname, isDirectory: &dir)) {
            do {
                try fm.createDirectoryAtPath(dirname, withIntermediateDirectories: false, attributes: nil)
            } catch let error as NSError {
                print("Could not create directory \(dirname)")
                print("Error: \(error.localizedDescription)")
            }
        }

        if (!dir) {
            print("There's already a file called \(dirname), cannot create directory")
            continue
        }

        do {
            try fm.moveItemAtPath(element, toPath: dirname + "/" + element)
        } catch let error as NSError {
            print("Could not move \(element) to directory \(dirname)")
            print("Error: \(error.localizedDescription)")
        }

    }
}
