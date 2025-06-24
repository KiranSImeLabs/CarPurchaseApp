//
//  NetworkManager.swift
//  POPUtilities
//
//  Created by Simelabs on 13/06/25.
//
import Foundation
import Combine

class NetworkManager:NetworkClient{
    
    private let baseURL: URL
    private let session: URLSession
    
    init(baseURL: URL, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func send<T>(_ request: T) -> AnyPublisher<T.ResponseType, any Error> where T : NetworkRequest {
        
        guard NetworkMonitor.shared.isConnected else {
            return Fail(error: URLError(.notConnectedToInternet)).eraseToAnyPublisher()
        }
        
        
        guard let url = URL(string: request.endpoint, relativeTo: baseURL) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method
        urlRequest.allHTTPHeaderFields = request.httpHeader
        
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                try request.decode(data: data)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
}
