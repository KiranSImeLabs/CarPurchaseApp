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
    @Published private(set) var filteredCars: [CarData] = []
    private var cancellables = Set<AnyCancellable>()
    
    
    
    private var allCars: [CarModel] = []
    
    init() {
        getCarList()
    }
    
    private func getCarList(){
        CarSearchServices().getSearchResult()
            .sink { error in
                print(error)
            } receiveValue: { [weak self] value in
                self?.filteredCars = value.data
            }
            .store(in: &cancellables)
    }
    
    
    private func setupBindings() {
        
//        Publishers.CombineLatest($searchText.debounce(for: .milliseconds(300), scheduler: RunLoop.main))
//            .map { [unowned self] (search, fuel) in
//                self.allCars.filter { car in
//                    (search.isEmpty || car.name.lowercased().contains(search.lowercased())) &&
//                    (fuel == nil || car.fuelType == fuel)
//                }
//            }
//            .assign(to: \.filteredCars, on: self)
//            .store(in: &cancellables)
    }
}
