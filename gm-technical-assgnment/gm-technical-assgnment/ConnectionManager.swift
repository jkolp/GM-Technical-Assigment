//
//  ConnectionManager.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/10/21.
//

import UIKit
import SystemConfiguration

class ConnectionManager {
    
    static let shared = ConnectionManager()
    
    static let reachable = SCNetworkReachabilityCreateWithName(nil, "www.google.com")
    
    func isReachable(reachability: SCNetworkReachability) -> Bool {
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)
        if (!isNetworkReachable(with: flags)) {
            return false
        }
        return true
    }
    
    private func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
        return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
    }
}
