//
//  MultipleSelectionPopUp.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 07/07/25.
//
import SwiftUI

struct MultipleSelectionPopUp: View {
    
    @Binding var showMenu:Bool
    @Binding var selectedItems:Set<String>
    let options:[String]
    
//    let options = ["Citro","Pontiac","Alfa","Fiat","BMW","Chevrolet","Ford","Volkswagen","Jaguar","Mercedes-Benz","Porsche","Buick Roadmaste","Cadillac"].sorted()

    var body: some View {
        VStack(alignment: .center) {
            Text("Select Options")
                .font(.headline)
                .padding()
            List {
                ForEach(options, id: \.self) { option in
                    Button{
                        if selectedItems.contains(option) {
                            selectedItems.remove(option)
                        } else {
                            selectedItems.insert(option)
                        }
                    }label: {
                        HStack {
                            Text(option)
                            Spacer()
                            if selectedItems.contains(option) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }else{
                                //circle
                                Image(systemName: "circle")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .listRowSeparator(.visible, edges: [.all])
            .listStyle(.plain)
            .background(Color.white)
            .frame( height: 400)
            .padding([.leading,.trailing],10)

            Button {
                showMenu = false
            } label: {
                Text("Done")
                    .foregroundStyle(.blue)
            }
            .padding()
        }
        .frame( width: 330)
        .background(Color.white)
    }
}

#Preview {
    MultipleSelectionPopUp(showMenu: .constant(true), selectedItems: .constant(["a","b"]) , options: ["a","b","c","b"])
}

