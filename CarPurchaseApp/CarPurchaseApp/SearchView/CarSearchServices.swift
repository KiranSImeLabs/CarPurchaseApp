//
//  CarSearchServices.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 27/06/25.
//

import Foundation
import Combine

protocol CarSearchServicesProtocol {
    func getSearchResult(linit:Int) -> AnyPublisher<CarModel, Error>
}
//http://192.168.0.72:3000/cars/getAllCars?limit=5&page=1

//http://192.168.0.72:3000/cars/getAllCars?selectedMake=Ford&maxPrice=60000&minPrice=10000page=1&limit=20

struct CarSearchServices:CarSearchServicesProtocol{
    func getSearchResult(linit:Int = 20) -> AnyPublisher<CarModel, any Error> {
        let request = CarSearchRequest(limit: linit)
        //let client = DefaultNetworkClient(baseURL: URL(string: "https://api.example.com")!)
        let client = NetworkManager(baseURL: URL(string: APIConstants.baseUrl)!)
       
        return client.send(request)
    }
    
    
    func getFilterSearchResult(serchKeys:[String:Any], page:Int) -> AnyPublisher<CarModel, any Error> {
        let request = CarFilterSearchRequest(page: page, paramDict: serchKeys)
        let client = NetworkManager(baseURL: URL(string: APIConstants.baseUrl)!)
        return client.send(request)
    }
    
    
    
    
}


struct CarSearchRequest: NetworkRequest {
    var httpHeader: [String : String]?
    let limit:Int
    typealias ResponseType = CarModel
    var endpoint:String{
        return APIConstants.getAllCars + "\(limit)"
    }
    let method = "GET"

    func decode(data: Data) throws -> CarModel {
        print(String(data: data, encoding: .utf8)!)
        return try JSONDecoder().decode(CarModel.self, from: data)
    }
}

struct CarFilterSearchRequest: NetworkRequest {
    var httpHeader: [String : String]?
    let page:Int
    let paramDict:[String:Any]
    //http://192.168.0.72:3000/cars/getAllCars?maxPrice=10000&minPrice=1000&limit=20&page=1
    typealias ResponseType = CarModel
    var endpoint:String{
        var string = ""
        /*
         ["selectedMake":selectedMake,"model":selectedModel,"fuel":fuel,"maxPrice":(Int(priceRange.upperBound)),"minPrice":(Int(priceRange.lowerBound)),"transmission":transmission,"seats":seats,"color":color,"modelYear":modelYearText,"bodyType":bodyTypeText]
         */

        if let val = paramDict["selectedMake"] as? String, val.trim().count > 0{
            string += "make=" + val
            
        }
        
        if let val = paramDict["maxPrice"] as? Int{
            string += "&maxPrice=\(val)"
            
        }
        if let val = paramDict["minPrice"] as? Int{
            string += "&minPrice=\(val)"
            
        }
        
        
        return APIConstants.getFilteredCar + string + "&page=\(1)&limit=\(20)"
    } //APIConstants.getAllCars
    let method = "GET"

    func decode(data: Data) throws -> CarModel {
        print(String(data: data, encoding: .utf8)!)
        return try JSONDecoder().decode(CarModel.self, from: data)
    }
}
