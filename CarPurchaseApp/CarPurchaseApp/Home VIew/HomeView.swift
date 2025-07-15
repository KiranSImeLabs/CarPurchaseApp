//
//  HomeView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 26/06/25.
//

import SwiftUI

struct HomeView: View {
    
    //    @Binding var tabSelection: Int
    @StateObject private var viewModel = CarListViewModel()
    
    var body: some View {
        
        ZStack(alignment:.top){
            
            VStack(alignment: .leading, spacing: 0) {
                
                //MARK: - Header
                
                HStack(spacing: 0){
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(AppColorConstants.secondaryColor)
                            .frame(width: 120,height: 90)
                        Image("Logo")
                            .resizable()
                            .frame(width: 88,height: 15)
                            .scaledToFit()
                            .padding(.bottom,20)
                            .animateOnScroll()
                        
                    }
                    Rectangle()
                        .fill(.white)
                        .frame(height: 70) // Adjust height as needed
                    
                }
                ScrollView{
                    //MARK: - Banner Image
                    
                    Image("Banner")
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .animateOnScroll()
                    
                    HStack {
                        Spacer()
                        Text("Explore Australia’s finest collection of \ncars, old and new.")
                            .foregroundStyle(AppColorConstants.primaryColor)
                            .font(.custom("SnellRoundhand", size: 25))
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .animateOnScroll()
                        Spacer()
                    }
                    .padding(.top)
                    
                    
                    
                    VStack {
                        
                        //MARK: - Featured Brands
                        
                        SectionHeader(title: "Featured Brands")
                            .padding(.bottom)
                            .animateOnScroll()
                        HStack{
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
                        }
                        .animateOnScroll()
                        
                        //MARK: - Why Motora?
                        SectionHeader(title: "Why Motora?")
                            .padding(.vertical, 15)

                        VStack(spacing: 10){
                            Text("More Than a Marketplace.\nMotora is a Movement")
                                .font(.headline)
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                            
                            Text("At Motora, every car has a story — and every driver deserves the perfect ride. Whether you're searching for a timeless classic or a cutting-edge machine, Motora brings together a carefully curated collection of vehicles to match your style, budget, and journey. With verified listings, smart search tools, and a seamless buying experience, Motora makes it easier than ever to discover, compare, and own the car that moves you.")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .multilineTextAlignment(.leading)
                            
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background {
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(.gray, lineWidth: 0.5)
                        }
                        .animateOnScroll()
                    }
                    .padding([.leading, .trailing,.top])
                    
                    
                    
                    if viewModel.filteredCars.count > 0 {
                        
                        //MARK: - Featured Lisiting
                        SectionHeader(title: "Featured Lisiting")
                            .padding(.leading,15)
                            .padding(.vertical, 25)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 1) {
                                ForEach(viewModel.filteredCars,id: \.id) { car in
                                    NavigationLink(destination:  CarDetailView(carId: car.id)) {
                                        CarCardView2(car: car)
                                            .frame(width: 340,height:220)
                                            .padding([.top,.bottom], 0)
                                    }
                                }
                            }
                            .padding([.leading,.trailing], 5)
                        }
                        .scrollIndicators(.visible)
                        .padding([.leading,.trailing],15)
                        .padding(.bottom,15)
                        .animateOnScroll()
                        
                    }else{
                        Text("No Car found")
                    }
                    
                    //MARK: - Motora Means More Cars, More Choice
                    SectionHeader(title: "Motora Means More Cars, More Choice")
                        .padding(.vertical, 25)
                        .padding(.leading,15)
                    VStack{
                        VStack(alignment: .center, spacing: 10){
                            
                            HStack{
                                WhyMotoraCard(text: "All Styles. One Place", subText:"Handpicked vintage\n& classic cars" , cardImage: "why_3")
                                WhyMotoraCard(text: "Verified Sellers", subText: "Each car listing is\nthoroughly reviewed", cardImage: "why_1")
                            }
                            
                            HStack{
                                WhyMotoraCard(text: "Nationwide Reach", subText:"Sellers from\nll across Australia" , cardImage: "why_2")
                                WhyMotoraCard(text: "Trusted Community", subText: "Safe platform for\nenthusiasts & collectors", cardImage: "why_4")
                            }
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(.gray, lineWidth: 0.5)
                            
                        }
                    }
                    .padding([.leading, .trailing,.top])
                }//ScroolView
                .scrollIndicators(.hidden)
                
            }//VStack
            
        }//ZStack
        .ignoresSafeArea()
        .background(Color.white)
        .backgroundStyle(.white)
        
    }
}

#Preview {
    HomeView()
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
                .font(.title3)
                .fontWeight(.bold)
            //            Text("✨")
            Spacer()
        }
    }
}
