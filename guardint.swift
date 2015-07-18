#!/usr/bin/env swift

import Darwin

func square(x: Int) -> Int {
    return x * x

}

func testNum(num: Int?) -> Void {
    guard num != nil else {
        print("num is nil")         // prints "num is nil"
        exit(0)
    }
    print(square(num!))
}

testNum(10);
testNum(nil);
