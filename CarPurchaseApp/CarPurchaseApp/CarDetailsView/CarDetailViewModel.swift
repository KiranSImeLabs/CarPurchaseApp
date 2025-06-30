//
//  CarDetailViewModel.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 27/06/25.
//

import Combine
import Foundation

class CarDetailViewModel: ObservableObject {
    @Published private(set) var carDetails: CarDetailModel?
    private var cancellables = Set<AnyCancellable>()

    
    internal func getCarDetails(id:String){
        
        CarDetailsServices().getCarDetails(id: id)
            .sink { error in
                print(error)
            } receiveValue: { [weak self] value in
                self?.carDetails = value
            }
            .store(in: &cancellables)
    }
}

    
