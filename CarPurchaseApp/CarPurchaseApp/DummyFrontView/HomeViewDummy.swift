//
//  HomeViewDummy.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 26/06/25.
//

import SwiftUI

struct HomeViewDummy: View {
    
    @Binding var tabSelection: Int
    @StateObject private var viewModel = CarListViewModel()
    
    var body: some View {
        
        ScrollView{
            ZStack(alignment:.top){
                Image("Banner_Image")
                    .resizable()
                    .frame(height: 300)
                    .scaledToFit()
                    .padding(0)
                
                VStack(alignment: .leading) {
                    Spacer().frame(height: 300) //230
                    
                    VStack(spacing: 16) {
                        SectionHeader(title: "Top Picks For You")
                        GridSection(items: ["Buy used car", "Sell car", "Get loans"])
                        
                        SectionHeader(title: "Manage Your Car")
                        GridSection(items: ["Orbit", "Pay challan", "FASTag", "Get insurance"])
                        
                        SectionHeader(title: "Check Before You Buy")
                        GridSection(items: ["New car check", "Used car check", "RTO check", "Vehicle history"])
                    }
                    .padding()
                    
                    
                    if viewModel.filteredCars.count > 0 {
                        
                        
                        ForEach(viewModel.filteredCars,id: \.id) { car in
                            NavigationLink(destination:  CarDetailView(carId: car.id)) {
                                CarCardView(car: car)
                                    .backgroundStyle(.brown)
                                    .shadow(color: .gray, radius: 8.0)
                                    .padding(10)
                            }
                            .foregroundStyle(.clear, .clear) // (title color of cell, right cheveron color of cell)
                            
                        }
                        
                        
                        // Car List
                       /* List {
                            ForEach(viewModel.filteredCars,id: \.id) { car in
                                NavigationLink(destination:  CarSearchView()) {
                                    CarCardView(car: car)
                                        .backgroundStyle(.brown)
                                        .shadow(color: .gray, radius: 8.0)
                                }
                                .foregroundStyle(.clear, .clear) // (title color of cell, right cheveron color of cell)
                                
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparatorTint(.clear)
                            
                        } //: LIST
                        .scrollIndicators(.hidden)
                        .listStyle(.plain)*/
                    }else{
                        Text("No Car found")
                    }
                }
            }
            .ignoresSafeArea()
            .background(Color.white)
            .backgroundStyle(.white)
        }
        
        Button{
            tabSelection = 1
        }label: {
            SearchTextField(text: $viewModel.searchText, isText: false)
                .padding([.leading,.trailing,.bottom], 15)
        }
    }
}

#Preview {
    HomeViewDummy(tabSelection: .constant(0))
}

struct GridSection: View {
    let items: [String]
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(items, id: \.self) { item in
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.1))
                        .frame(height: 70)
                        .overlay(Text("🚗")) // Replace with actual icons
                    Text(item)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct SectionHeader: View {
    let title: String
    var body: some View {
        HStack {
            Text("✨")
            Text(title.uppercased())
                .font(.headline)
                .fontWeight(.bold)
            Text("✨")
            Spacer()
        }
        .padding(.top)
    }
}
