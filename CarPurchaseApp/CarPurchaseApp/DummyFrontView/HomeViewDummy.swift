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
                
                VStack(alignment: .leading) {
//                    Spacer()
//                        .frame(height: 60)
                    
                    HStack(spacing: 0){
                        ZStack(alignment: .bottom) {
                            Rectangle()
                                .fill(Color.init(red: 145.0/255.0, green: 127.0/255.0, blue: 109.0/255.0))
                                .frame(width: 90,height: 70)
                            Image("Logo")
                                .resizable()
                                .frame(width: 45,height: 20)
                                .scaledToFill()
                                .padding(.bottom,10)
                            
                        }
                        Rectangle()
                            .fill(Color.init(red: 242.0/255.0, green: 232.0/255.0, blue: 203.0/255.0))
                            .frame(height: 70) // Adjust height as needed
                        
                    }
                    
                    Image("Banner_Image")
                        .resizable()
                        .frame(height: 150)
                        .scaledToFit()
                        .padding(0)
                    // Spacer().frame(height: 300) //230
                    
                    VStack(spacing: 16) {
                        SectionHeader(title: "Top Picks For You")
                        GridSection(items: ["Buy used car", "Sell car", "Get loans"])
                        
                        SectionHeader(title: "Featured Lisiting")
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
            //            Text("✨")
            Text(title.uppercased())
                .font(.headline)
                .fontWeight(.bold)
            //            Text("✨")
            Spacer()
        }
        .padding(.top)
    }
}
