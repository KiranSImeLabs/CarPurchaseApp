//
//  CarModel.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//

import Foundation
struct Car: Identifiable,Hashable {
    let id = UUID()
    let name: String
    let model: String
    let price: String
    let fuelType: FuelType
    let mileage: String
    let imageName: String
}

enum FuelType: String, CaseIterable, Identifiable {
    case petrol, diesel, electric, hybrid
    var id: String { rawValue }
}
