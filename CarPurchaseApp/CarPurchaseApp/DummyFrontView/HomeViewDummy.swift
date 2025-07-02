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
                                .fill(AppColorConstants.primaryColor)
                                .frame(width: 110,height: 70)
                            Image("Logo")
                                .resizable()
                                .frame(width: 88,height: 15)
                                .scaledToFit()
                                .padding(.bottom,5)
                            
                        }
                        Rectangle()
                            .fill(AppColorConstants.secondaryColor)
                            .frame(height: 70) // Adjust height as needed
                        
                    }
                    
                    Image("Banner_Image")
                        .resizable()
                        .frame(height: 190)
                        .scaledToFit()
                        .padding(0)
                    //rgba(88, 122, 120, 1)
                    HStack {
                        Spacer()
                        Text("Explore Australia’s finest collection of cars, old and new.")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .fontWeight(.regular)
                        Spacer()
                        //(size: 40, weight: .regular, design: .i)
                    }
                    
                    
                    // Spacer().frame(height: 300) //230
                    
                    VStack() {
                        SectionHeader(title: "Top Picks For You")
                            .padding(.bottom)
                        GridSection(items: ["Buy car", "Sell car", "Get loans"])
                            .padding(.bottom)
                        SectionHeader(title: "Featured Brands")
                            .padding(.bottom)
                        HStack{
                            Spacer()
                            Image("icon_ford")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            Spacer()
                            Image("icon_benz")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Spacer()
                            Image("icon_cheverlot")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            Spacer()
                            Image("icon_bmw")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Spacer()
                        }
                    }
                    .padding([.leading, .trailing,.top])
//                    .padding(.bottom,0)
                    
                    
                    if viewModel.filteredCars.count > 0 {
                        
                        SectionHeader(title: "Featured Lisiting")
                            .padding(.top,5)
                            .padding(.leading,15)
                            .padding(.bottom,5)
                        
                        ForEach(viewModel.filteredCars,id: \.id) { car in
                            NavigationLink(destination:  CarDetailView(carId: car.id)) {
                                CarCardView(car: car)
                                    .backgroundStyle(.brown)
                                    .padding([.leading,.trailing],8)
                                    .padding(.bottom,3)
                            }
                            .foregroundStyle(.clear, .clear)
                            // (title color of cell, right cheveron color of cell)
                            
                        }
                    }else{
                        Text("No Car found")
                    }
                }
            }
            .ignoresSafeArea()
            .background(Color.white)
            .backgroundStyle(.white)
        }
        
        SearchTextField(text: $viewModel.searchText, isText: false)
            .padding([.leading,.trailing,.bottom], 5)
            .onTapGesture {
                tabSelection = 1
            }
    }
}

#Preview {
    HomeViewDummy(tabSelection: .constant(0))
}

struct GridSection: View {
    let items: [String]
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    let image = ["buy_used_car","Sell_car","get_loan"]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(Array(items.enumerated()), id: \.element) { index, item in

                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.1))
                        .frame(height: 70)
                        .overlay(
                            Image(image[index])
                            .resizable()
                            .frame(width: 42, height: 40, alignment: .center)
                            .tint(AppColorConstants.primaryColor)
                            .foregroundStyle(AppColorConstants.primaryColor)
                        )
                    Text(item)
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
    }
}
