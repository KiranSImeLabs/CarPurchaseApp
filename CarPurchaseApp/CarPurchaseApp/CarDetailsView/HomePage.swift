//
//  HomePage.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 03/07/25.
//

import SwiftUI

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // App Bar
                    HStack {
                        Text("CarBuy")
                            .font(.largeTitle).bold()
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .padding(.horizontal)
                    
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search cars, models...", text: .constant(""))
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    // Featured Cars
                    Text("Featured")
                        .font(.title2).bold()
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(0..<5) { index in
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.blue.opacity(0.7))
                                    .frame(width: 250, height: 150)
                                    .overlay(
                                        Text("Car \(index + 1)")
                                            .foregroundColor(.white)
                                            .bold()
                                    )
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Categories
                    Text("Categories")
                        .font(.title2).bold()
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(["SUV", "Sedan", "Hatchback", "Luxury"], id: \.self) { category in
                                Text(category)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(Color(.systemGray5))
                                    .cornerRadius(20)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // New Arrivals
                    Text("New Arrivals")
                        .font(.title2).bold()
                        .padding(.horizontal)
                    
                    VStack(spacing: 15) {
                        ForEach(0..<5) { index in
                            HStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.orange.opacity(0.7))
                                    .frame(width: 100, height: 70)
                                VStack(alignment: .leading) {
                                    Text("New Car \(index + 1)")
                                        .font(.headline)
                                    Text("$30,000")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomePage()
}
