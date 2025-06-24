//
//  NetworkClient.swift
//  POPUtilities
//
//  Created by Simelabs on 13/06/25.
//

import Combine

protocol NetworkClient {
    func send<T: NetworkRequest>(_ request: T) -> AnyPublisher<T.ResponseType, Error>
}
