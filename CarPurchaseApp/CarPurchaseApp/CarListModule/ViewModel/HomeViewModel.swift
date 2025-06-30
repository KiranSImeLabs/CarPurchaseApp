//
//  HomeViewModel.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 27/06/25.
//

import Foundation

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var selectedFuel: FuelType? = nil
    @Published private(set) var filteredCars: [CarModel] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupBindings()
    }
    
    //MARK: - Custom methods
    private func setupBindings() {
    }
    
    
    
}
