//
//  CarSearchViewModel.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 26/06/25.
//

import Combine
import Foundation

class CarSearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var selectedFuel: FuelType? = nil
    @Published private(set) var filteredCars: [CarData] = []
    
    private var cancellables = Set<AnyCancellable>()
    private var allCars: [CarData] = []
    
    
    init() {
        setupBindings()
        searchCar()
    }
    
    private func setupBindings() {
        
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .map{[unowned self] search in
                self.allCars.filter { car in
                    (search.isEmpty || car.title.lowercased().contains(search.lowercased()))
                }
                
            }
            .compactMap { $0 }
            .assign(to: \.filteredCars, on: self)
            .store(in: &cancellables)
        
//        $selectedFuel
//            .map { [unowned self] (fuel) in
//                self.allCars.filter { car in
//                    (fuel == nil || car.fuelType == fuel)
//                }
//            }
//            .assign(to: \.filteredCars, on: self)
//            .store(in: &cancellables)
    }
    
    private func searchCar(){
        CarSearchServices().getSearchResult()
            .sink { error in
                print(error)
            } receiveValue: { [weak self] value in
                self?.allCars = value.data
                self?.filteredCars = value.data
            }
            .store(in: &cancellables)

    }
    
    func filterSearch(page:Int,dict:[String:Any]){
        CarSearchServices().getFilterSearchResult(serchKeys: dict, page: page)
            .sink { error in
                print(error)
            } receiveValue: { [weak self] value in
                self?.filteredCars = value.data
            }
            .store(in: &cancellables)
    }
}
