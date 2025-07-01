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
    
    @State private var isImageLoaded = false
    
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let car = viewModel.carDetails{
                    
                    AsyncImage(url: URL(string: (car.mainImage))) { image in
                        image.resizable()
                            .resizable()
                            .scaledToFit()
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                            .onAppear {
                                isImageLoaded = true
                            }
                    } placeholder: {
                        Color.clear
                    }
                    
                    .clipped()
                    .cornerRadius(20.4)
                    
                    if isImageLoaded{
                        CustomCardView{
                            VStack(alignment: .leading, spacing: 8){
                                Text("\(car.specifications.generalInformation.brand) \(car.specifications.generalInformation.model)")
                                    .font(.title.bold())
                                Text("A$ \(car.price)")
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
                                    PerformanceStatView(value: "\(car.specifications.performanceSpecs.maximumSpeed)", unit: "", label: "Top Speed")
                                    PerformanceStatView(value: "4.9", unit: "sec", label: "0-60 mph")
                                }
                                .padding(.bottom,10)
                                
                                Divider()
                                //fuelType
                                VStack(alignment: .leading,spacing: 8) {
                                    Label(car.specifications.generalInformation.startOfProduction, systemImage: "calendar")
                                    Label(car.specifications.performanceSpecs.fuelType, systemImage: "bolt.fill")
                                    Label("90 km", systemImage: "speedometer")
                                    
                                    Label("Pune", systemImage: "mappin")
                                    Label(car.specifications.drivetrainBrakesSuspensionSpecs.numberOfGearsAndTypeOfGearbox, systemImage: "transmission")
                                    Label("Listed: 5h ago", systemImage: "clock")
                                    
                                    //calendar
                                }
                                .font(.subheadline)
                                .foregroundColor(.black)
                                
                                Divider()
                                
                                Text("General Information")
                                    .font(.headline)
                                
                                GeneralInformationView(title: "Body Type", subtitle: car.specifications.generalInformation.bodyType)
                                GeneralInformationView(title: "Doors", subtitle: car.specifications.generalInformation.doors)
                                GeneralInformationView(title: "Seats", subtitle: car.specifications.generalInformation.seats)
                                GeneralInformationView(title: "Engine", subtitle: car.specifications.generalInformation.modificationEngine)
                                
                                if viewModel.otherImages.count > 0 {
                                    
                                    Divider()
                                    
                                    Text("Gallery")
                                        .font(.headline)
                                    
                                    ForEach(viewModel.otherImages, id: \.self) { item in
                                        AsyncImage(url: URL(string: (item))) { image in
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
                                    }
                                    
                                }
                                
                            }
                        }
                    }else{
                        HStack{
                            Spacer()
                            VStack(alignment: .center) {
                                Spacer().frame(height: 100)
                                ProgressView("Loading...")
                                    .tint(AppColorConstants.primaryColor)
                                    .task {
                                        // This task runs while waiting for the image
                                    }
                            }
                            Spacer()
                        }
                    }
                }else{
                    Text("Waiting for results")
                }
            }
            .backgroundStyle(.red)
            .padding()
            
            if isImageLoaded{
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
        }
        .background(Color.white)
        //        .navigationTitle(car?.specifications.generalInformation.brand ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            self.viewModel.getCarDetails(id: id)
        }
    }
}


struct GeneralInformationView: View{
    let title:String
    let subtitle:String
    var body: some View{
        HStack{
            Text(title + " : ")
                .font(.subheadline)
            Text(subtitle)
                .font(.footnote)
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
