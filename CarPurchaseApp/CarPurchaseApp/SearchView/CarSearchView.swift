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
                        .animateOnScroll()
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
                            .padding(.vertical, 13)
                            .background(Color.black)
                        //                            .cornerRadius(12)
                            .padding(.trailing, 10)
                    }
                    .padding(.trailing, 10)
                    .animateOnScroll()
                    
                }
                .padding(.bottom, 10)
                
                
                
                // Car List
                List {
                    ForEach(viewModel.filteredCars,id: \.id) { car in
                        CarCardView(car: car)
                            .padding(.bottom,5)
                            .onAppear {
                                if let value = viewModel.filteredCars.last,car.id == value.id{
                                    viewModel.loadMore()
                                }
                            }
                    }
                    .listRowBackground(Color.white)
                    .listRowSeparatorTint(.white)
                    
                } //: LIST
                .scrollIndicators(.hidden)
                .listStyle(.plain)
                .backgroundStyle(Color.white)
                .background(Color.white)
            }
        }
        .toast(isPresented:.constant(!viewModel.errorString.isEmpty) , message: viewModel.errorString)
        .fullScreenCover(isPresented: $showOverlay) {
            SearchFilterView(onApply: { dic in
                print(dic)
                viewModel.resetSearchDetails()
                viewModel.filterSearch(dict: dic)
                
            }, onReset: {
                viewModel.resetSearchDetails()
                viewModel.filterSearch(dict: [String : Any]())
            })
        }
    }
}

#Preview {
    CarSearchView()
}
