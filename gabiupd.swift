//
//  main.swift
//  MCStatus
//
//  Created by Sebestyén Gábor on 2015. 09. 12..
//  Copyright © 2015. Sebestyén Gábor. All rights reserved.
//
// Original source: http://www.cs.ucsb.edu/~almeroth/classes/W01.176B/hw2/examples/udp-server.c

import Foundation


// CONSTANTS
let INADDR_ANY : UInt32 = 0x00000000


let sockfd = socket(AF_INET, SOCK_DGRAM, 0)

let servaddr_p = UnsafeMutablePointer<sockaddr_in>.alloc(sizeof(sockaddr_in))
servaddr_p.memory = sockaddr_in(
    sin_len: 0,
    sin_family: UInt8(AF_INET),
    sin_port: UInt16(32000).bigEndian,
    sin_addr: in_addr(),
    sin_zero: (0,0,0,0,0,0,0,0)
)


// bind socket
bind(sockfd, UnsafePointer<sockaddr>( servaddr_p ), UInt32( sizeof(sockaddr_in) ) )


let mesg = UnsafeMutablePointer<CChar>.alloc(1000);
let cliaddr = UnsafeMutablePointer<sockaddr_in>.alloc( sizeof(sockaddr_in))
let recvlen = UnsafeMutablePointer<socklen_t>.alloc(sizeof(socklen_t))

while true {
    let len = sizeof(sockaddr_in)

    var n = recvfrom(sockfd, mesg, 1000, 0, UnsafeMutablePointer<sockaddr>(cliaddr) , recvlen)

    sendto(sockfd,mesg,n,0, UnsafeMutablePointer<sockaddr>(cliaddr), UInt32(sizeof(sockaddr_in)))

    print("-------------------------------------------------------")
    mesg[n] = 0
    print("Received the following:")
    if let str = String.fromCString(mesg) {
        print(str)
    }
    print("-------------------------------------------------------")
}
