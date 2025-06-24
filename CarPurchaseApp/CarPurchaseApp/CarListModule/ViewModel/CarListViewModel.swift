//
//  CarListViewModel.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//

import Combine
import Foundation

class CarListViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var selectedFuel: FuelType? = nil
    @Published private(set) var filteredCars: [Car] = []
    
    private var allCars: [Car] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadCars()
        setupBindings()
    }
    
    private func loadCars() {
        allCars = [
            Car(name: "BMW M4", model: "Coupe 2022", price: "A$75 Lakh", fuelType: .petrol, mileage: "15,000 km", imageName: "bmw"),
            Car(name: "Tesla Model 3", model: "Performance 2023", price: "A$50 Lakh", fuelType: .electric, mileage: "5,000 km", imageName: "tesla"),
            Car(name: "Hyundai Ioniq", model: "EV 2024", price: "A$35 Lakh", fuelType: .electric, mileage: "2,000 km", imageName: "ioniq"),
            Car(name: "Kia Seltos", model: "GTX 2021", price: "A$15 Lakh", fuelType: .diesel, mileage: "20,000 km", imageName: "seltos")
        ]
        filteredCars = allCars
    }
    
    private func setupBindings() {
        Publishers.CombineLatest($searchText.debounce(for: .milliseconds(300), scheduler: RunLoop.main), $selectedFuel)
            .map { [unowned self] (search, fuel) in
                self.allCars.filter { car in
                    (search.isEmpty || car.name.lowercased().contains(search.lowercased())) &&
                    (fuel == nil || car.fuelType == fuel)
                }
            }
            .assign(to: \.filteredCars, on: self)
            .store(in: &cancellables)
    }
}
