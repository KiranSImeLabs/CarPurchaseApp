//
//  APIConstants.swift
//  Brollert
//
//  Created by Simelabs on 09/10/24.
//

import Foundation
internal struct APIConstants {
    static var baseUrl :String{
        return AppConstant.isProduction ? "http://192.168.0.72:3000" : "http://192.168.0.72:3000"
    }
    //http://192.168.0.72:3000/cars/getAllCars?page=1&limit=5
    static let httpPost  =  "POST"
    static let httpGet  =  "GET"
    static let httpPut  =  "PUT"
    static let httpDelete  =  "DELETE"
    static let timeoutInterval60 = 60.0
    static let timeoutInterval30 = 30.0
    static let timeoutInterval10 = 10.0
    static let cachePolicy:NSURLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    
    //{{baseUrl}}/getAllCars?page=1&limit=5
    static let getAllCars = "/cars/getAllCars?page=1&limit=20"
    static let getFilteredCar = "/cars/getAllCars?"
    //http://192.168.0.72:3000/cars/getCarDetails/b6dd97be-dfbd-445b-93d8-7107488ae4d6
    static let getCarDetails = "/cars/getCarDetails/"
    
    /*
     For search
     {{baseUrl}}/cars/getAllCars?page=1&limit=5&make=tata
     */
    
    
    static let loginUrl = "/login/"
    static let otp_verificationUrl = "/otp_verification/"
    static let refresh_tokenUrl = "/otp_verification/"
    static let registerUrl = "/register/"
    static let weather_forecast = "/weather_forecast/"
    static let edit_profile = "/edit_profile/"
    static let resen_Otp = "/resend_otp/"
    static let delete_profile = "/delete_profile/"
    static let refresh_token = "/refreshtoken/"
    //"/refreshtoken/"
    
}


