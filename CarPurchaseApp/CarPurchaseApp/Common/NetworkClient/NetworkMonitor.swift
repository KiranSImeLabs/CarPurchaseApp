//
//  NetworkMonitor.swift
//  POPUtilities
//
//  Created by Simelabs on 13/06/25.
//

import Network

final class NetworkMonitor {
    static let shared = NetworkMonitor()

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")

    private(set) var isConnected: Bool = false

    private init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            print("Internet Connectivity: \(self.isConnected ? "Available" : "Unavailable")")
        }
        monitor.start(queue: queue)
    }
}


/*
 Apply like this
 =====================================
 
 if NetworkMonitor.shared.isConnected {
     print("Internet is available")
 } else {
     print("No internet connection")
 }
 */
