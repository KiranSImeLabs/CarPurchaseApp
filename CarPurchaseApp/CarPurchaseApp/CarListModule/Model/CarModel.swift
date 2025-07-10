//
//  CarModel.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//

import Foundation
// MARK: - CarModel
struct CarModel: Codable {
    let data: [CarData]
    let page, limit, total: Int
}

// MARK: - Datum
struct CarData: Codable {
    let id, title: String
    let mainImage: String
    let price: Int
    let startOfProduction, fuelType, odometer, mileage: String
    let description: String
}
