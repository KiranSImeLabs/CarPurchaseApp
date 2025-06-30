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
    
    
    var body: some View {
        ZStack(alignment: .top){
//            Image("Banner_Image")
//                .resizable()
//                .frame(height: 300)
//                .scaledToFit()
//                .padding(0)
            VStack(alignment: .leading) {
                HStack{
                    SearchTextField(text: $viewModel.searchText)
                        .padding(.leading, 10)
                    Button {
                        showOverlay = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 15)
                            .background(Color.black)
                            .cornerRadius(12)
                            .shadow(color: .white, radius: 1.0)
                    }
                    .padding(.trailing, 10)

                }
                
                // Car List
                List {
                    ForEach(viewModel.filteredCars,id: \.id) { car in
                        NavigationLink(destination:  CarDetailView(carId: car.id)) {
                            CarCardView(car: car)
                                .shadow(color: .gray, radius: 8.0)
                        }
                        .foregroundStyle(.white) // (title color of cell, right cheveron color of cell)
                        
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
