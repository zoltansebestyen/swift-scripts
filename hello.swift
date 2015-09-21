#!/usr/bin/env swift
print("hello world!!")
// dump(Process.arguments)
// print ( Process.arguments.count )
if (Process.arguments.count < 2) {
    let me = Process.arguments[0]
        print("Usage: \(me) fileglob1 [fileglob2 ..]")
            exit(-1)
}

for idx in 1...Process.arguments.count {
    print Process.arguments[idx]
}

// if (Process.arguments.count > 1) {
//     print(Process.arguments[1])
// }
// 
