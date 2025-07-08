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
                        .background(AppColorConstants.tertiaryColor)
                }.padding([.leading,.top,.trailing],0)
                
            } placeholder: {
                Rectangle()
                    .background(Color.white.opacity(0.3))
                    .backgroundStyle(Color.white.opacity(0.3))
                    .foregroundStyle(Color.white.opacity(0.3))
                    .frame(height: 300)
                ProgressView("Loading...")
                    .tint(.white)
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
        .overlay(content: {
            
            /*
             // Remove the cheveron button in list cell
             */
            NavigationLink(destination:  CarDetailView(carId: car.id)) {
                EmptyView()
            }
            .opacity(0)
        })
        .background {
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color.black, lineWidth: 0.5)
        }
    }
}

//#Preview {
//    CarCardView(car: Car(name: "BMW M4", model: "Coupe 2022", price: "A$75 Lakh", fuelType: .petrol, mileage: "15,000 km", imageName: "bmw"))
//        .frame(width: 300, height: 300)
//}

struct CarCardView2: View {
    var car: CarData
    var body: some View {
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string: (car.mainImage))) { image in
                
                ZStack(alignment: .bottomLeading) {
                    image.resizable()
                        .scaledToFill()
                        .padding([.leading,.trailing],0)
                        .clipped()
                    
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.8),Color.black.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: 80)
                        .overlay(
                            HStack{
                                VStack(alignment: .leading,spacing: 5) {
                                    Text(car.title)
                                        .font(Font.system(size: 18.0))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    Text("Engine (typical): 5.7L V8 350ci")
                                        .font(Font.system(size: 15.0))
                                        .fontWeight(.regular)
                                        .foregroundStyle(.white)
                                        .multilineTextAlignment(.center)
                                }
                                .padding(.leading, 15)
                                Spacer()
                            }
                            
                        )
                    
                }
//                .padding([.leading,.top,.trailing],0)
                
            } placeholder: {
                Color.clear
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color.black, lineWidth: 0.5)
        }
    }
}
