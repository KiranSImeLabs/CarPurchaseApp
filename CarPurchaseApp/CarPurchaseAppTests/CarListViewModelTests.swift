//
//  CarListViewModelTests.swift
//  CarPurchaseAppTests
//
//  Created by Simelabs on 25/06/25.
//

import Testing
@testable import CarPurchaseApp
import Combine

struct CarListViewModelTests {

    @Test func initialLoad_shouldContainAllCars() {
           let viewModel = CarListViewModel()
           #expect(viewModel.filteredCars.count == 4)
       }

       @Test func searchText_shouldFilterToMatchingCar() async {
           let viewModel = CarListViewModel()
           viewModel.searchText = "Tesla"

           try? await Task.sleep(nanoseconds: 500_000_000) // debounce wait
           #expect(viewModel.filteredCars.count == 1)
//           #expect(viewModel.filteredCars.first?.name == "Tesla Model 3")
       }

       @Test func selectingFuelType_shouldFilterCarsByFuel() async {
           let viewModel = CarListViewModel()
           viewModel.selectedFuel = .electric

           try? await Task.sleep(nanoseconds: 500_000_000)
           #expect(viewModel.filteredCars.count == 2)
//           #expect(viewModel.filteredCars.allSatisfy { $0.fuelType == .electric })
       }

       @Test func searchAndFuelCombined_shouldReturnCorrectCar() async {
           let viewModel = CarListViewModel()
           viewModel.searchText = "Hyundai"
           viewModel.selectedFuel = .electric

           try? await Task.sleep(nanoseconds: 500_000_000)
           #expect(viewModel.filteredCars.count == 1)
//           #expect(viewModel.filteredCars.first?.name == "Hyundai Ioniq")
       }

       @Test func clearingSearchText_shouldStillFilterByFuel() async {
           let viewModel = CarListViewModel()
           viewModel.selectedFuel = .electric
           viewModel.searchText = ""

           try? await Task.sleep(nanoseconds: 500_000_000)
           #expect(viewModel.filteredCars.count == 2)
//           #expect(viewModel.filteredCars.allSatisfy { $0.fuelType == .electric })
       }

}
