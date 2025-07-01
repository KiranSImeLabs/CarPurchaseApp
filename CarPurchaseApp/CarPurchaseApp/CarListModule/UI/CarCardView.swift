//
//  CarCardView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//
import SwiftUI

struct CarCardView: View {
    var car: CarData
    
    var body: some View {
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string: (car.mainImage))) { image in
                image.resizable()
            } placeholder: {
                Color.clear
            }
            .scaledToFill()
            .cornerRadius(12)
            
            
//            Image(car.mainImage)
//                .resizable()
//                .scaledToFill()
//            //                .frame(height: 180)
//                .cornerRadius(12)
            
            Text(car.title)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            
            Text("A$ \(car.price ?? 32000)")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .background(Color.black)
                .cornerRadius(12)
                .padding(.bottom,5)
            
            
//            HStack {
//                Text("⚙️  Mannual")
//                Spacer()
//                Text("⛽ \(car.fuelType.rawValue.capitalized)")
//                Spacer()
//                Text("🏁 \(car.mileage)")
//            }
//            .font(.system(size: 12, weight: .regular))
//            .fontWeight(.medium)
//            .foregroundColor(.black)
//            Text("📍 Sydney")
//                .font(.subheadline)
//                .fontWeight(.regular)
//                .foregroundColor(.gray)
//                .padding(.vertical, 5)
        }
        .padding()
        .background(Color(.white))
        //        .background(BackgroundView(topColor: .white, bottomColor: .white))
        .cornerRadius(16)
        //        .shadow(color: .gray, radius: 20.0)
    }
}

//#Preview {
//    CarCardView(car: Car(name: "BMW M4", model: "Coupe 2022", price: "A$75 Lakh", fuelType: .petrol, mileage: "15,000 km", imageName: "bmw"))
//        .frame(width: 300, height: 300)
//}
