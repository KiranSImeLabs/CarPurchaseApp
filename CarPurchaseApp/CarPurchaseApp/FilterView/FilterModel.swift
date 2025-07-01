//
//  FilterModel.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 26/06/25.
//

import Foundation
struct FilterModel {
    let id = UUID()
    let brandName: String
    let brandModel: String
    let priceRange: String
    let transmission: String
    let fuelType: FuelType
    let mileage: String
    let imageName: String
}

enum TransmissionType: String {
    case mannual = "Mannual"
    case automatic  = "Automatic"
    case both  = "both"
}

enum FuelType:String{
    case petrol = "Petrol"
    case electric = "Electric"
    case diesel = "Diesel"
    case hybrid = "Hybrid"
}
