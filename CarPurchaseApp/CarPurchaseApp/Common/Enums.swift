//
//  Enums.swift
//  WeatherDemo
//
//  Created by Argus Asia on 08/06/24.
//

import Foundation

enum themeType:String{
    case darkTheme = "theme_1"
    case skyTheme = "theme_2"
}

enum APIServiceError: Error {
    case retry
    case serverError
    case invalidResponse
    case noData
    case parsingError
    case unAuthoriseCall
    case timeOutError
    case noInternet
    case failedWithMessage
}

