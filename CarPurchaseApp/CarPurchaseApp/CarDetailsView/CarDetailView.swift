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
    @State private var isImageLoaded = false
    @State private var fullImageURL: URL?
    
    init(carId: String) {
        id = carId
    }
    
    fileprivate func addFullScreenView(_ img: URL) -> some View {
        return ZStack{
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.black.opacity(0.8))
                .padding(0)
            AsyncImage(url: img) { image in
                image.resizable()
                    .scaledToFit()
                    .padding(10)
            } placeholder: {
                Color.black.opacity(0.8)
            }
        }
        .onTapGesture {
            fullImageURL = nil
        }
//        .padding(0)
//        .background(Color.black.opacity(0.8))
    }
    
    fileprivate func addMainImageSection(_ car: CarDetailModel) -> some View {
        return AsyncImage(url: URL(string: (car.mainImage))) { image in
            ZStack(alignment: .bottomLeading) {
                image.resizable()
                    .padding([.leading,.top],0)
                    .clipped()
                    .scaledToFill()
                    .padding(.leading, 0)
                    .padding(.trailing, 0)
                    .onAppear {
                        isImageLoaded = true
                    }
                
                Text("A$ \(car.price)")
                    .font(Font.system(size: 14, weight: .semibold))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading, 5)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(AppColorConstants.primaryColor)
            }
        } placeholder: {
            Color.clear
        }
        
        .clipped()
    }
    
    fileprivate func addMainImformationView(_ car: CarDetailModel) -> some View {
        return //fuelType
       ( VStack(alignment: .leading,spacing: 8) {
            Label(car.specifications.generalInformation.startOfProduction, systemImage: "calendar")
            Label(car.specifications.performanceSpecs.fuelType, systemImage: "bolt.fill")
            Label("90 km", systemImage: "speedometer")
            
            Label("Pune", systemImage: "mappin")
            Label(car.specifications.drivetrainBrakesSuspensionSpecs.numberOfGearsAndTypeOfGearbox, systemImage: "transmission")
            Label("Listed: 5h ago", systemImage: "clock")
            
            //calendar
        }
        .padding(.bottom,10)
        .font(.subheadline)
        .foregroundColor(.black) )
    }
    
    fileprivate func addGeneralInformationView(_ car: CarDetailModel) -> some View {
        return VStack(alignment: .leading,spacing: 8) {
            Label(car.specifications.generalInformation.bodyType, systemImage: "car")
            Label(car.specifications.generalInformation.doors + " doors", systemImage: "car.window.left")
            
            Label(car.specifications.generalInformation.seats + " Seats", systemImage: "carseat.left")
            
            Label(car.specifications.generalInformation.modificationEngine, systemImage: "engine.combustion")
            
        }
        .padding(.bottom,10)
        .font(.subheadline)
        .foregroundColor(.black)
    }
    
    fileprivate func addGalleryImages() -> ForEach<[String], String, some View> {
        return ForEach(viewModel.otherImages, id: \.self) { item in
            AsyncImage(url: URL(string: (item))) { image in
                image.resizable()
                    .scaledToFill()
                    .padding(0)
                    .onTapGesture {
                        fullImageURL = URL(string: (item))
                    }
            } placeholder: {
                Color.black.opacity(0.8)
            }
            .clipped()
        }
    }
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let car = viewModel.carDetails{
                    
                    addMainImageSection(car)
                    
                    if isImageLoaded{
                        CustomCardView{
                            VStack(alignment: .leading, spacing: 8){
                                Text("\(car.specifications.generalInformation.brand) \(car.specifications.generalInformation.model)")
                                    .font(.title.bold())
                                    .padding(.bottom,10)
                                Divider()
                                    .padding(.bottom,10)
                                
                                //PerformanceStatView
                                HStack(spacing: 32) {
                                    PerformanceStatView(value: "363", unit: "mi", label: "Range (EPA est.)")
                                    PerformanceStatView(value: "\(car.specifications.performanceSpecs.maximumSpeed)", unit: "", label: "Top Speed")
                                    PerformanceStatView(value: "4.9", unit: "sec", label: "0-60 mph")
                                }
                                .padding(.bottom,10)
                                
                                Divider()
                                    .padding(.bottom,10)
                                
                                //Main Info section
                                addMainImformationView(car)
                                
                                Divider()
                                    .padding(.bottom,10)
                                
                                //General Info section
                                
                                Text("General Information")
                                    .font(.headline)
                                    .padding(.bottom,10)
                                
                                addGeneralInformationView(car)
                                
                                
                                
                                if viewModel.otherImages.count > 0 {
                                    
                                    Divider()
                                        .padding(.bottom,10)
                                    
                                    // Gallery Images
                                    
                                    Text("Gallery")
                                        .font(.headline)
                                        .padding(.bottom,10)
                                    
                                    
                                    addGalleryImages()
                                    
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
        .overlay {
            if let img = fullImageURL{
                addFullScreenView(img)
            }
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
            .background {
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.black, lineWidth: 0.5)
            }
//            .cornerRadius(16)
//            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}

//#Preview {
//    CarDetailView(car: Car(name: "BMW M4", model: "Coupe 2022", price: "A$75 Lakh", fuelType: .petrol, mileage: "15,000 km", imageName: "bmw"))
//}
