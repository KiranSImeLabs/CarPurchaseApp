//
//  CarDetailView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//

import SwiftUI

struct CarDetailView: View {
    let id:String
    @StateObject private var viewModel = CarDetailViewModel()
    
    init(carId: String) {
        id = carId
    }
    
    
    let car: CarDetailModel? = nil
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let car = viewModel.carDetails{
//                    Image(car.mainImage)
                        
                    
                    AsyncImage(url: URL(string: (car.mainImage))) { image in
                        image.resizable()
                            .resizable()
                            .scaledToFit()
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                    } placeholder: {
                        Color.clear
                    }
                    
                    .clipped()
                    .cornerRadius(20.4)
                    
                    
                    
                    CustomCardView{
                        VStack(alignment: .leading, spacing: 8){
                            Text("\(car.specifications.generalInformation.brand) \(car.specifications.generalInformation.model)")
                                .font(.title.bold())
                            Text("A$12345")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .background(Color.black)
                                .cornerRadius(12)
                                .padding(.bottom,5)
                            Divider()
                            //PerformanceStatView
                            HStack(spacing: 32) {
                                PerformanceStatView(value: "363", unit: "mi", label: "Range (EPA est.)")
                                PerformanceStatView(value: "\(car.specifications.performanceSpecs.fuelType)", unit: "mph", label: "Top Speed")
                                PerformanceStatView(value: "4.9", unit: "sec", label: "0-60 mph")
                            }
                            .padding(.bottom,10)
                            
                            Divider()
                            //fuelType
                            VStack(alignment: .leading,spacing: 8) {
                                Label(car.specifications.generalInformation.startOfProduction, systemImage: "calendar")
                                Label(car.specifications.performanceSpecs.fuelType, systemImage: "bolt.fill")
                                //                            Label(car.mileage, systemImage: "speedometer")
                                
                                Label("Pune", systemImage: "mappin")
                                Label(car.specifications.drivetrainBrakesSuspensionSpecs.numberOfGearsAndTypeOfGearbox, systemImage: "transmission")
                                Label("Listed: 5h ago", systemImage: "clock")
                                //calendar
                            }
                            .font(.subheadline)
                            .foregroundColor(.black)
                            
                            Divider()
                            
                            //Featured Details
                            
                            Text("Featured Details")
                                .font(.headline)
                            Text("Color")
                                .font(.subheadline)
                            Text("Stealth grey")
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .background(Color.black)
                                .cornerRadius(12)
                                .padding(.bottom,5)
                            
                            
                            //Description
                            
                            Text("Description")
                                .font(.subheadline)
                            Text("This high-performance vehicle offers incredible design, great fuel efficiency, and top-tier tech, making it a great choice for urban and long-distance travel.")
                                .font(.footnote)
                                .foregroundColor(.black)
                            
                        }
                    }
                }else{
                    Text("Waiting for results")
                }
            }
            .backgroundStyle(.red)
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
        .background(Color.white)
        .navigationTitle(car?.specifications.generalInformation.brand ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            self.viewModel.getCarDetails(id: id)
        }
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


struct CustomCardView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}

//#Preview {
//    CarDetailView(car: Car(name: "BMW M4", model: "Coupe 2022", price: "A$75 Lakh", fuelType: .petrol, mileage: "15,000 km", imageName: "bmw"))
//}
