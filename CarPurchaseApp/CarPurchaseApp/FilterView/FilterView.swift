//
//  FilterView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 27/06/25.
//

import SwiftUI

struct SearchFilterView: View {
    
    @Environment(\.dismiss) private var dismiss
    let onApply: ([String:Any]) -> Void
    
    
    @State private var selectedMake: String = ""
    @State private var selectedModel: String = ""
    
    @State private var fuel: String = "Petrol"
    @State private var priceRange: ClosedRange<Float> = 10_000...60_000
    
    @State private var transmission: String = "Mannual"
    @State private var seats: String = "2"
    @State private var color: String = "All"
    @State private var modelYearText:String = ""
    @State private var bodyTypeText:String = ""
    
    
    
    
    fileprivate func makeAndModelSection() -> some View {
        return (
            HStack {
                VStack(alignment: .leading) {
                    Text("Make")
                    Menu {
                        Button("Citro")
                        { selectedMake = "Citro" }
                        Button("Pontiac")
                        { selectedMake = "Pontiac" }
                        Button("Alfa")
                        { selectedMake = "Alfa" }
                        Button("Fiat")
                        { selectedMake = "Fiat" }
                        Button("BMW")
                        { selectedMake = "BMW" }
                        Button("Chevrolet")
                        { selectedMake = "Chevrolet" }
                        Button("Ford")
                        { selectedMake = "Ford" }
                        Button("Volkswagen")
                        { selectedMake = "Volkswagen" }
                        Button("Jaguar")
                        { selectedMake = "Jaguar" }
                        Button("Mercedes-Benz")
                        { selectedMake = "Mercedes-Benz" }
                        Button("Porsche")
                        { selectedMake = "Porsche" }
                        Button("Buick Roadmaster ")
                        { selectedMake = "Buick Roadmaster " }
                        Button("Cadillac")
                        { selectedMake = "Cadillac" }
                        
                        
                        
                        
                    } label: {
                        HStack {
                            Text(selectedMake.isEmpty ? "Select" : selectedMake)
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundStyle(.black)
                        }
                        
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    }
                    .border(Color.clear)
                }
                
                VStack(alignment: .leading) {
                    Text("Model")
                    Menu {
                        Button("Model X") { selectedModel = "Model X" }
                        Button("Model Y") { selectedModel = "Model Y" }
                    } label: {
                        HStack {
                            Text(selectedModel.isEmpty ? "Select" : selectedModel)
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundStyle(.black)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    }
                    .border(Color.clear)
                }
            })
//        .padding(0)
//        .background(Color.black.opacity(0.8))
    }
    
    
    
    
    
    var body: some View {
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
                    
                    //MARK: - MODEL YEAR:
                    
                    VStack(alignment: .leading) {
                        Text("MODEL YEAR:")
                        ZStack(alignment: .leading){
                            Capsule()
                                .fill(Color.white)
                                .frame(height: 40)
                                .shadow(color: .black, radius: 2.0)
                            TextField("Enter model year.", text: $modelYearText)
                                .padding(.leading,20)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    //MARK: - MODEL TYPE:
                    VStack(alignment: .leading) {
                        Text("BODY TYPE:")
                        ZStack(alignment: .leading){
                            Capsule()
                                .fill(Color.white)
                                .frame(height: 40)
                                .shadow(color: .gray, radius: 2.0)
                            TextField("Enter body type.", text: $bodyTypeText)
                                .padding(.leading,20)
                                .cornerRadius(10)
                        }
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
                    selectedMake = ""
                    selectedModel = ""
                    fuel = "All"
                    priceRange = 10_000...60_000
                    transmission = "Newest"
                    seats = "Compact"
                    color = "All"
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundStyle(.black)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(25)
                
                Button("Apply") {
                    // Apply logic
                    
                    onApply(["selectedMake":selectedMake,"model":selectedModel,"fuel":fuel,"maxPrice":(Int(priceRange.upperBound)),"minPrice":(Int(priceRange.lowerBound)),"transmission":transmission,"seats":seats,"color":color,"modelYear":modelYearText,"bodyType":bodyTypeText])
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
//        .padding()
    }
}

struct WrapHStack: View {
    let items: [String]
    @Binding var selected: String
    var colors: [String: Color] = [:]
    
    var body: some View {
        FlexibleView(
            availableWidth: UIScreen.main.bounds.width - 40,
            data: items,
            spacing: 10,
            alignment: .leading
        ) { item in
            Button(action: {
                selected = item
            }) {
                HStack {
                    if let color = colors[item] {
                        Circle()
                            .fill(color)
                            .frame(width: 10, height: 10)
                            .shadow(color: .gray, radius: 1.0, y: 1.0)
                    }
                    Text(item)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(selected == item ? Color.black : Color.clear)
                .foregroundColor(selected == item ? .white : .primary)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.5))
                )
            }
        }
    }
}

// Helper for flexible wrapping:
struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content

    init(availableWidth: CGFloat,
         data: Data,
         spacing: CGFloat,
         alignment: HorizontalAlignment,
         @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.availableWidth = availableWidth
        self.data = data
        self.spacing = spacing
        self.alignment = alignment
        self.content = content
    }

    var body: some View {
        var width: CGFloat = 0
        var rows: [[Data.Element]] = [[]]

        for item in data {
            let itemWidth = itemWidth(for: item)
            if width + itemWidth + spacing > availableWidth {
                rows.append([item])
                width = itemWidth + spacing
            } else {
                rows[rows.count - 1].append(item)
                width += itemWidth + spacing
            }
        }

        return VStack(alignment: alignment, spacing: spacing) {
            ForEach(rows.indices, id: \.self) { rowIndex in
                HStack(spacing: spacing) {
                    ForEach(rows[rowIndex], id: \.self) { item in
                        content(item)
                    }
                }
            }
        }
    }

    func itemWidth(for item: Data.Element) -> CGFloat {
        let label = UILabel()
        label.text = "\(item)"
        label.sizeToFit()
        return label.frame.width + 32 // add padding
    }
}
#Preview {
    SearchFilterView(onApply: { val in
        print(val)
        
    })
}

