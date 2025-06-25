//
//  CarDetailView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//

import SwiftUI

struct CarDetailView: View {
    let car: Car
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(car.imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                    .frame(height: 300)
                    .clipped()
                    
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(car.name) \(car.model)")
                        .font(.largeTitle.bold())
                    Text(car.price)
                        .font(.title2)
                        .foregroundColor(.secondary)
                    
                    HStack(spacing: 16) {
                        Label(car.fuelType.rawValue.capitalized, systemImage: "bolt.fill")
                        Label(car.mileage, systemImage: "speedometer")
                        Label("Listed: 5h ago", systemImage: "clock")
                    }
                    .font(.subheadline)
                    .foregroundColor(.white)
                    
                    Divider()
                    
                    Text("Description")
                        .font(.headline)
                    Text("This high-performance vehicle offers incredible design, great fuel efficiency, and top-tier tech, making it a great choice for urban and long-distance travel.")
                        .font(.body)
                        .foregroundColor(.white)
                    
                    Divider()
                }
                .padding()
            }
            .background(.clear)
            .padding()
            
            //Bottom button
            ZStack(alignment: .center){
                HStack(alignment: .center) {
                    Button(action: {}) {
                        Label("Call Seller", systemImage: "phone.fill")
                    }
                    .buttonStyle(PrimaryButtonStyle(color: .green))
                    
                    Button(action: {}) {
                        Label("Book Test Drive", systemImage: "car.fill")
                    }
                    .buttonStyle(PrimaryButtonStyle(color: .blue))
                }
                .padding(10)
            }
            
        }
        .background(BackgroundView(topColor: .gray, bottomColor: .brown))
        .navigationTitle(car.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    var color: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(color.opacity(configuration.isPressed ? 0.7 : 1))
            .foregroundColor(.white)
            .cornerRadius(12)
    }
}


#Preview {
    CarDetailView(car: Car(name: "BMW M4", model: "Coupe 2022", price: "A$75 Lakh", fuelType: .petrol, mileage: "15,000 km", imageName: "bmw"))
}
