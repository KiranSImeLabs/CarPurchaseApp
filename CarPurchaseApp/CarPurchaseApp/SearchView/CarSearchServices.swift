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
        if paramDict.count > 0 {
            
            var queryItem  = [URLQueryItem]()
            
            if let val = paramDict["selectedMake"] as? String, val.trim().count > 0{
//                string += "make=" + val
                
                queryItem.append(URLQueryItem(name: "make", value: val))
            }
            
            if let val = paramDict["maxPrice"] as? Int{
//                string += "&maxPrice=\(val)"
                queryItem.append(URLQueryItem(name: "maxPrice", value: "\(val)"))
                
            }
            if let val = paramDict["minPrice"] as? Int{
//                string += "&minPrice=\(val)"
                queryItem.append(URLQueryItem(name: "minPrice", value: "\(val)"))
            }
            
            queryItem.append(URLQueryItem(name: "page", value: "\(page)"))
            queryItem.append(URLQueryItem(name: "limit", value: "\(20)"))
            
            let queryString = queryItem.compactMap { item -> String? in
                guard let value = item.value else { return nil }
                return "\(item.name)=\(value)"
            }.joined(separator: "&")
            
            return APIConstants.getFilteredCar + queryString
            
        }else{
            return APIConstants.getFilteredCar + "page=\(page)&limit=\(20)"
        }
        
        
        
    } //APIConstants.getAllCars
    let method = "GET"

    func decode(data: Data) throws -> CarModel {
        print(String(data: data, encoding: .utf8)!)
        return try JSONDecoder().decode(CarModel.self, from: data)
    }
}
