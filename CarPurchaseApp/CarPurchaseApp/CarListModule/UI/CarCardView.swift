//
//  CarCardView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//
import SwiftUI

struct CarCardView: View {
    var car: Car
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(car.imageName)
                .resizable()
                .scaledToFill()
//                .frame(height: 180)
                .cornerRadius(12)
            
            Text(car.name)
                .font(.headline)
                .foregroundColor(.white)
            Text(car.model)
                .font(.subheadline)
                .foregroundColor(.white)
            
            HStack {
                Text(car.price)
                Spacer()
                Text("⛽ \(car.fuelType.rawValue.capitalized)")
                Spacer()
                Text("🏁 \(car.mileage)")
            }
            .font(.caption)
            .foregroundColor(.white)
        }
        .padding()
//        .background(Color(.systemBackground))
        .background(BackgroundView(topColor: .black, bottomColor: .gray))
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}

#Preview {
    CarCardView(car: Car(name: "BMW M4", model: "Coupe 2022", price: "A$75 Lakh", fuelType: .petrol, mileage: "15,000 km", imageName: "bmw"))
        .frame(width: 300, height: 300)
}
