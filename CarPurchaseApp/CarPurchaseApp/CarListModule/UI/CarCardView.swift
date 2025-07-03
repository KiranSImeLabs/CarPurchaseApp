//
//  CarCardView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//
import SwiftUI



struct CarCardView: View {
    var car: CarData
    
    fileprivate func specificationStack(imageStr:String, text:String) -> VStack<TupleView<(some View, Text)>> {
        return VStack(alignment: .center,spacing: 10){
            Image(imageStr)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
            Text(text)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string: (car.mainImage))) { image in
                
                ZStack(alignment: .bottomLeading) {
                    image.resizable()
                        .padding([.leading,.top],0)
                        .clipped()

                    Text("A$ \(car.price ?? 32000)")
                        .font(Font.system(size: 14, weight: .semibold))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(AppColorConstants.primaryColor)
                }.padding([.leading,.top,.trailing],0)
                
            } placeholder: {
                Color.clear
            }
            .scaledToFill()
            
            VStack(alignment: .leading,spacing: 5) {
                Text(car.title)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                Text("Engine (typical): 5.7L V8 350ci")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundStyle(.black)
            }
            .padding([.leading,.trailing], 30)
            .padding([.top])
            
//            Divider()
//                .frame(maxWidth: .infinity)
//                .frame(height: 1)
//                .background(Color.black)
            
            HStack {
                specificationStack(imageStr: "icon_speedometer", text: "120 km")
                Spacer()
                specificationStack(imageStr: "icon_pump", text: "Petrol")
                Spacer()
                specificationStack(imageStr: "icon_geartype", text: "CVT")
            }
            .padding([.leading,.trailing], 50)
            .padding([.top,.bottom])
            
//            Divider()
//                .frame(maxWidth: .infinity)
//                .frame(height: 1)
//                .background(Color.black)
            
//            Text("A$ \(car.price ?? 32000)")
//                .font(.system(size: 15, weight: .semibold))
//                .foregroundStyle(.black)
//                .padding([.leading,.trailing], 30)
//                .padding([.top,.bottom])
        }
//        .padding()
        .background {
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color.black, lineWidth: 0.5)
        }
        
        //        .background(BackgroundView(topColor: .white, bottomColor: .white))
//        .cornerRadius(16)
        //        .shadow(color: .gray, radius: 20.0)
    }
}

//#Preview {
//    CarCardView(car: Car(name: "BMW M4", model: "Coupe 2022", price: "A$75 Lakh", fuelType: .petrol, mileage: "15,000 km", imageName: "bmw"))
//        .frame(width: 300, height: 300)
//}
