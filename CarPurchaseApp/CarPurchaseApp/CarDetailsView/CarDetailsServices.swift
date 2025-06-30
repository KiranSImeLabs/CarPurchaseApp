//
//  CarDetailsServices.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 27/06/25.
//

import Foundation
import Combine

protocol CarDetailsServicesProtocol {
    func getCarDetails(id:String) -> AnyPublisher<CarDetailModel, Error>
}

//http://192.168.0.72:8080/cars/swagger/index.html/getAllCars?page=1&limit=5
struct CarDetailsServices:CarDetailsServicesProtocol{
    func getCarDetails(id:String) -> AnyPublisher<CarDetailModel, any Error> {
        let request = CarDetailRequest(endpoint: APIConstants.getCarDetails + id)
        let client = NetworkManager(baseURL: URL(string: APIConstants.baseUrl)!)
        return client.send(request)
    }
    
}


struct CarDetailRequest: NetworkRequest {
    func decode(data: Data) throws -> CarDetailModel {
        print(String(data: data, encoding: .utf8)!)
        return try JSONDecoder().decode(CarDetailModel.self, from: data)
    }
    
    typealias ResponseType = CarDetailModel
    
    var httpHeader: [String : String]?
    let endpoint:String
    let method = "GET"
}
