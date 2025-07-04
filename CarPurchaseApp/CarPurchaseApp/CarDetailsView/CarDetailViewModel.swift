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
    var otherImages:[String] = [String]()
    private var cancellables = Set<AnyCancellable>()

    
    internal func getCarDetails(id:String){
        
        CarDetailsServices().getCarDetails(id: id)
            .sink { error in
                print(error)
            } receiveValue: { [weak self] value in
                self?.otherImages.removeAll()
                for img in value.otherImages{
                    self?.otherImages.append(img.src)
                }
                self?.carDetails = value
            }
            .store(in: &cancellables)
    }
    
    
    
    func getImagesOfColor(color:String = "All") -> [String]{
        if let cardDetil = carDetails{
            
            if color == "All" {
                return cardDetil.otherImages .map { $0.src }
            }
            
            return cardDetil.otherImages
                .filter { $0.color.lowercased() == color.lowercased() }
                .map { $0.src }
        }else{
            return []
        }
        
        
    }
    
    
    
}

    
