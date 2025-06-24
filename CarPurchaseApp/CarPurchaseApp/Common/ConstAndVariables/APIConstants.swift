//
//  APIConstants.swift
//  Brollert
//
//  Created by Simelabs on 09/10/24.
//

import Foundation
internal struct APIConstants {
    static var baseUrl :String{
        return AppConstant.isProduction ? "https://brollert.simelabs.in" : "https://brollert.simelabs.in"
    }
    static let googleApiScope = "https://www.googleapis.com/auth/calendar.readonly"
    static let httpPost  =  "POST"
    static let httpGet  =  "GET"
    static let httpPut  =  "PUT"
    static let httpDelete  =  "DELETE"
    static let timeoutInterval60 = 60.0
    static let timeoutInterval30 = 30.0
    static let timeoutInterval10 = 10.0
    static let cachePolicy:NSURLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    
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


