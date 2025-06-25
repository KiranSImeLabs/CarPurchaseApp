//
//  CarListView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//

import SwiftUI

struct CarListView: View {
    @StateObject private var viewModel = CarListViewModel()
    
    var body: some View {
        NavigationStack {
            
            ZStack(alignment: .center){
//                Color.white.ignoresSafeArea()
                VStack {
                    // Search bar
                    TextField("Search cars...", text: $viewModel.searchText)
                        .padding(10)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    // Filter options
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Button("All") {
                                viewModel.selectedFuel = nil
                            }
                            .filterButtonStyle(selected: viewModel.selectedFuel == nil)
                            
                            ForEach(FuelType.allCases) { fuel in
                                Button(fuel.rawValue.capitalized) {
                                    viewModel.selectedFuel = fuel
                                }
                                .filterButtonStyle(selected: viewModel.selectedFuel == fuel)
                            }
                        }
                        .padding(.horizontal)
                    }//ScrollView
                    
                    // Car List
                    List {
                        ForEach(viewModel.filteredCars,id: \.id) { car in
                            NavigationLink(destination:  CarDetailView(car: car)) {
                                CarCardView(car: car)
                            }
                            .foregroundStyle(.clear, .clear) // (title color of cell, right cheveron color of cell)
                            
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparatorTint(.clear)
                        
                    } //: LIST
                    .scrollIndicators(.hidden)
                    .listStyle(.plain)
                    .background(Color.clear)
                    
                }//VStack
                .background(BackgroundView(topColor: .gray, bottomColor: .yellow))
            }//ZStack
            
            .navigationTitle("Cars")
        }
    }
}


//MARK: - Preview

struct CarListView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
            .preferredColorScheme(.light)
        CarListView()
            .preferredColorScheme(.dark)
    }
}

