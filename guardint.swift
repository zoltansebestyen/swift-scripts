#!/usr/bin/env swift
var num: Int? = nil
func square(x: Int) -> Int {
    return x * x

}
if num != nil {
    print(square(num!))

} else {
    print("num is nil")         // prints "num is nil"

}

