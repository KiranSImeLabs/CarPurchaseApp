//
//  CarSearchView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 26/06/25.
//

import SwiftUI

struct CarSearchView: View {
    @StateObject private var viewModel = CarSearchViewModel()
    @State private var showOverlay = false
    @FocusState var isFocusOn: Bool
    
    
    var body: some View {
        ZStack(alignment: .top){
            VStack(alignment: .leading) {
                Spacer().frame(height: 5.0)
                HStack{
                    
                    SearchTextField(text: $viewModel.searchText)
                        .focused($isFocusOn)
                        .padding(.leading, 10)
//                        .onAppear {
//                            DispatchQueue.main.async {
//                                isFocusOn = true
//                            }
//                        }
                    Button {
                        showOverlay = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 15)
                            .background(Color.black)
//                            .cornerRadius(12)
                            .shadow(color: .white, radius: 1.0)
                    }
                    .padding(.trailing, 10)
                    
                }
                .padding(.bottom, 10)
                
                
                
                // Car List
                List {
                    ForEach(viewModel.filteredCars,id: \.id) { car in
                        CarCardView(car: car)
                            .padding(.bottom,5)
                        //                            .shadow(color: .gray, radius: 8.0)
                            .overlay(content: {
                                NavigationLink(destination:  CarDetailView(carId: car.id)) {
                                    EmptyView()
                                }
                                .opacity(0)
                            })
                        // (title color of cell, right cheveron color of cell)
                        
                    }
                    .listRowBackground(Color.white)
                    .listRowSeparatorTint(.white)
                    
                } //: LIST
                .scrollIndicators(.hidden)
                .listStyle(.plain)
                .backgroundStyle(Color.white)
                .background(Color.white)
            }
        }.fullScreenCover(isPresented: $showOverlay) {
            SearchFilterView(onApply: { dic in
                print(dic)
                viewModel.filterSearch(page: 1, dict: dic)
                
            })
        }
    }
}

#Preview {
    CarSearchView()
}
