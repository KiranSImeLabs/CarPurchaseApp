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
    @Published var errorString:String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private var allCars: [CarData] = []
    private var listPage = 0
    private var totalCount = 0
    private var searchKeys:[String:Any] = [String:Any]()
    
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
        
        self.filterSearch(dict: searchKeys)
    }
    
    func filterSearch(dict:[String:Any]){
        self.searchKeys = dict
        CarSearchServices().getFilterSearchResult(serchKeys: dict, page: listPage + 1)
            .sink { result in
                print(result)
                switch result{
                case.failure(let err) :
                    self.errorString = err.localizedDescription
                default:
                    self.errorString = ""
                    break
                }
            } receiveValue: { [weak self] value in
                guard let self = self else {return}
                self.errorString = ""
                self.populateValues(value: value)
            }
            .store(in: &cancellables)
    }
    
    func loadMore(){
        if self.totalCount > self.allCars.count{
            searchCar()
        }
    }
    
    
    private func populateValues(value:CarModel){
        self.listPage = Int(value.page) ?? 0
        self.totalCount = value.total
        self.allCars.append(contentsOf: value.data)
        if searchText.count > 0{
            let searchArr = value.data.filter{$0.title.contains(searchText)}
            filteredCars.append(contentsOf: searchArr)
        }else{
            self.filteredCars.append(contentsOf: value.data)
        }
    }
    
    func resetSearchDetails(){
        self.listPage = 0
        self.allCars.removeAll()
        self.filteredCars.removeAll()
        self.totalCount = 0
    }
    
}
