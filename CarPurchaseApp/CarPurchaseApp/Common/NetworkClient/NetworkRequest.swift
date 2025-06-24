//
//  NetworkRequest.swift
//  POPUtilities
//
//  Created by Simelabs on 13/06/25.
//

import Foundation

protocol NetworkRequest:NSObject{
    
    associatedtype ResponseType: Decodable
    var endpoint: String { get }
    var method: String { get }
    var httpHeader:[String : String]? { get }
    
    func decode(data: Data) throws -> ResponseType
}
