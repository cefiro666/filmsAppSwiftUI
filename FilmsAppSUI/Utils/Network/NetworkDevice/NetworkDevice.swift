//
//  NetworkDevice.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 26.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SystemConfiguration

// MARK: - isConnectedToNetwork
public class NetworkDevice {
    
    public class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr()
        zeroAddress.sa_len = UInt8(MemoryLayout<sockaddr>.size)
        zeroAddress.sa_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }) else { return false }
        var flags = SCNetworkReachabilityFlags()
        guard SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) else { return false }
        return flags.contains(.reachable) && !flags.contains(.connectionRequired)
    }
    
}
