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
                                .frame(width: 77,height: 20)
                                .scaledToFit()
                                .padding(.bottom,10)
                            
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
                        Text("Drive the Legacy. Own a Classic")
                            .italic()
                            .foregroundStyle(Color.init(red: 88.0/255.0, green: 122.0/255.0, blue: 120.0/255.0))
                            .font(.subheadline)
                            .fontWeight(.regular)
                        Spacer()
                        //(size: 40, weight: .regular, design: .i)
                    }
                    
                    
                    // Spacer().frame(height: 300) //230
                    
                    VStack(spacing: 16) {
                        SectionHeader(title: "Top Picks For You")
                        GridSection(items: ["Buy used car", "Sell car", "Get loans"])
                        SectionHeader(title: "Featured Vintage Brands")
                        
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
                    .padding(.bottom,0)
                    
                    
                    if viewModel.filteredCars.count > 0 {
                        
                        SectionHeader(title: "Featured Lisiting")
                            .padding(.top,5)
                            .padding(.leading,15)
                            .padding(.bottom,5)
                        
                        ForEach(viewModel.filteredCars,id: \.id) { car in
                            NavigationLink(destination:  CarDetailView(carId: car.id)) {
                                CarCardView(car: car)
                                    .backgroundStyle(.brown)
                                    .shadow(color: .gray, radius: 2.0)
                                    .padding(5)
                            }
                            .foregroundStyle(.clear, .clear) // (title color of cell, right cheveron color of cell)
                            
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

    let image = ["car.fill","car.2.fill","banknote.fill"]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(Array(items.enumerated()), id: \.element) { index, item in

                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.1))
                        .frame(height: 70)
                        .overlay(Label("", systemImage: image[index]).foregroundStyle(AppColorConstants.primaryColor))
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
        .padding(.top)
    }
}
