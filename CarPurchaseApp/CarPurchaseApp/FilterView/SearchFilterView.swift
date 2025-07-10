//
//  SearchFilterView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 09/07/25.
//


import SwiftUI

//make, model, fuel, transmission and color
enum popUPType:String{
    case none = "None"
    case makeModel = "makeModel"
    case fuel = "Fuel"
    case transmission = "Transmission"
    case seats = "Searts"
    case colors = "Colors"
}
struct SearchFilterView: View {
    
    @Environment(\.dismiss) private var dismiss
    let onApply: ([String:Any]) -> Void
    let onReset: () -> Void
    var popUpType:popUPType = .none
//    @State private var selectedMake: String = ""
    @State private var selectedModel: String = ""
    
    @State private var fuel: String = "Petrol"
    @State private var priceRange: ClosedRange<Float> = 10_000...60_000
    
    @State private var transmission: String = "Mannual"
    @State private var seats: String = "2"
    @State private var color: String = "All"
    @State private var modelYearText:String = ""
    @State private var KmsDriven:String = ""
    @State private var selectedBodyType:String = "All"
    
    
    
    @State private var selectedMakes: Set<String> = []
    @State private var selectedBodyTypes: Set<String> = []
    @State private var selectedFuelType: Set<String> = []
    @State private var selectedTransmissionType: Set<String> = []
    @State private var selectedColorType: Set<String> = []
    
    @State private var showMenu = false
    
    
    
    let makeArray = ["Citro","Pontiac","Alfa","Fiat","BMW","Chevrolet","Ford","Volkswagen","Jaguar","Mercedes-Benz","Porsche","Buick Roadmaste","Cadillac"].sorted()
    
    
    fileprivate func addMennuItems(title:String) -> some View  {
        return HStack{
            Button(title)
            { selectedMakes.insert(title) }
        }
        
       
    }
    
    
    fileprivate func  makeAndModelSection()  -> some View{
        return (
            HStack {
                selectOptionBox(title: "MAKE & MODEL", selectedValue: selectedMakes.isEmpty ? "Select" : selectedMakes.first!)
                
//                VStack(alignment: .leading) {
//                    Text("Model")
//                    Menu {
//                        Button("Model X") { selectedModel = "Model X" }
//                        Button("Model Y") { selectedModel = "Model Y" }
//                    } label: {
//                        HStack {
//                            Text(selectedModel.isEmpty ? "Select" : selectedModel)
//                                .foregroundStyle(.black)
//                            Spacer()
//                            Image(systemName: "chevron.down")
//                                .foregroundStyle(.black)
//                        }
//                        .padding()
//                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
//                    }
//                    .border(Color.clear)
//                }
            })
//        .padding(0)
//        .background(Color.black.opacity(0.8))
    }
    
    fileprivate func selectOptionBox(title:String, selectedValue:String) -> some View {
        return (
            VStack(alignment: .leading) {
                Text(title)
                
                HStack {
                    Text(selectedValue.isEmpty ? "Select" : selectedValue)
                        .foregroundStyle(.black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.black)
                }
                
                .padding()
                .background(RoundedRectangle(cornerRadius: 0).stroke(Color.gray.opacity(0.5), lineWidth: 1))
            }
        )
//        .padding(0)
//        .background(Color.black.opacity(0.8))
    }
    
    
    
    
    
    var body: some View {
        ZStack{
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Text("Search Filter")
                    .font(.title2)
                    .bold()
                Spacer()
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 30,height: 30)
                        .foregroundStyle(AppColorConstants.primaryColor)
                        
                }
            }
            .padding(.horizontal, 20)
            /*
             Citro DS /19710/ Specs
             Pontiac GTO /19712/ Specs
             Alfa Romeo Spider /19713/ Specs
             Fiat 500 /19715/ Specs
             */
            ScrollView{
                VStack(alignment: .leading, spacing: 20) {
                    
                    //MARK: - Make and Model
                    makeAndModelSection()
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            showMenu.toggle()
                        }
                    
                    //MARK: - MODEL YEAR:
                    
                    VStack(alignment: .leading) {
                        Text("MODEL YEAR:")
                        SearchTextField(text: $modelYearText, placeHolder: "Enter model year.")
                    }
                    .padding(.horizontal, 10)
                    
                    //MARK: - Kilo meters driven:
                    VStack(alignment: .leading) {
                        Text("Kms Driven:")
                        SearchTextField(text: $KmsDriven, placeHolder: "Kms DRIVEN.")
                    }
                    .padding(.horizontal, 10)
                    
                    //MARK: - Body Type
                    
                    VStack(alignment: .leading) {
                        Text("BODY TYPE:")
                        WrapHStack(items: ["All","Sedan", "SUV", "Coupe", "Hatchback"], selected: $selectedBodyType)
                    }
                    
                    .padding(.horizontal, 10)
                    
                    //MARK: - FUEL
                    VStack(alignment: .leading) {
                        Text("FUEL:")
                        HStack {
                            ForEach(["Petrol", "Diesel", "CNG", "Hybrid"], id: \.self) { condition in
                                Button(action: {
                                    fuel = condition
                                }) {
                                    Text(condition)
                                        .padding(.horizontal)
                                        .padding(.vertical, 8)
                                        .background(fuel == condition ? Color.black : Color.clear)
                                        .foregroundColor(fuel == condition ? .white : .primary)
                                        .cornerRadius(20)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.gray.opacity(0.5))
                                        )
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    //MARK: - PRICE RANGE
                    
                    VStack(alignment: .leading) {
                        Text("PRICE RANGE:")
                        Text("A$\(Int(priceRange.lowerBound/1000))K - A$\(Int(priceRange.upperBound/1000))K")
                        RangeSlider(value: $priceRange, bounds: 10_000...100_000).accentColor(.black)
                            .accentColor(.black)
                    }
                    .padding(.horizontal, 10)
                    
                    //MARK: - TRANSMISSION TYPE
                    
                    VStack(alignment: .leading) {
                        Text("TRANSMISSION TYPE:")
                        WrapHStack(items: ["Mannual", "Automatic", "Hybrid"], selected: $transmission)
                    }
                    .padding(.horizontal, 10)
                    
                    //MARK: - SEATS TYPE
                    
                    VStack(alignment: .leading) {
                        Text("SEATS:")
                        WrapHStack(items: ["2", "4", "6"], selected: $seats)
                    }
                    .padding(.horizontal, 10)
                    
                    //MARK: - Color
                    
                    VStack(alignment: .leading) {
                        Text("COLOR:")
                        WrapHStack(items: ["All", "Red", "White", "Blue", "Black"], selected: $color, colors: ["Red": .red, "White": .white, "Blue": .blue, "Black": .black])
                    }
                    
                    .padding(.horizontal, 10)
                    
                }
            }
            .scrollIndicators(.hidden)
            
            HStack {
                Button("Reset") {
                    selectedModel = ""
                    fuel = "All"
                    priceRange = 10_000...60_000
                    transmission = "Newest"
                    seats = "Compact"
                    color = "All"
                    selectedMakes.removeAll()
                    onReset()
                    dismiss()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundStyle(.black)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(25)
                
                Button("Apply") {
                    // Apply logic
                    
                    onApply(["selectedMake":selectedMakes,"model":selectedModel,"fuel":fuel,"maxPrice":(Int(priceRange.upperBound)),"minPrice":(Int(priceRange.lowerBound)),"transmission":transmission,"seats":seats,"color":color == "All" ? "" : color,"modelYear":modelYearText,"bodyType":selectedBodyType == "All" ? "" : selectedBodyType])
                    dismiss()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(25)
            }
            .padding(.horizontal, 20)
        }
            if showMenu{
                ZStack{
                    Color.black.opacity(0.4)
                    Rectangle()
                        .background(Color.black.opacity(0.1))
                        .backgroundStyle(Color.clear)
                        .foregroundColor(Color.clear)
                        .onTapGesture {
                            showMenu = false
                        }
                    MultipleSelectionPopUp(showMenu: $showMenu, selectedItems: $selectedMakes, options: makeArray)
                }
                .ignoresSafeArea()
                
                
            }
            
        }
        
//        .popover(isPresented: $showMenu) {
//            MultipleSelectionPopUp(showMenu: $showMenu, selectedItems: $selectedMakes, options: makeArray)
//        }
//        .padding()
    }
}
