//
//  FilterViewModel.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 27/06/25.
//

import Foundation
import Combine

/*
         make?: string;
         model?: string;
         modelYear?: number;
         fuel?: string;
         transmission?: string;
         color?: string;
         seats?: number;
 */

class FilterViewModel: ObservableObject {
    @Published var priceValue: Int = 10000
    
    @Published var make: String? = nil
    @Published var model: String? = nil
    @Published var modelYear: Int? = nil
    @Published var seats: Int? = nil
    @Published var color: String? = nil
    
    @Published var selectedFuel: FuelType? = nil
    @Published var transmission: TransmissionType? = nil
    
    
    @Published private(set) var filteredCars: [CarModel] = []
    
    var maxValue = 100005
    var minValue = 9999
    
}
