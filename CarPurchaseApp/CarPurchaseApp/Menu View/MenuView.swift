//
//  MenuView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 01/07/25.
//

import SwiftUI
//rgba(158, 143, 127, 1)
struct ExampleRow: View {
    let text:String
    let image:String
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(Color.init(red: 158.0/255.0, green: 143.0/255.0, blue: 127.0/255.0)) // Icon color

            Text(text)
                .foregroundColor(.primary) // Text color
        }
    }
}

struct MenuView: View {
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        List {
            Section(header: Text("Menu")) {
                ExampleRow(text: "Buy used car", image: "car.fill")
                ExampleRow(text: "Sell car", image: "arrowshape.turn.up.right.fill")
                ExampleRow(text: "Get loans", image: "banknote.fill")
            }
            
            Section(header: Text("Settings")) {
                ExampleRow(text: "Account", image: "person.crop.circle.fill")
                ExampleRow(text: "About us", image: "info.circle.fill")
                ExampleRow(text: "Privacy Policy", image: "lock.shield.fill")
                ExampleRow(text: "Terms", image: "doc.text.fill")
                ExampleRow(text: "Contact", image: "phone.fill")
            }
            
            VStack(spacing: 16) {
                SectionHeader(title: "Why Vintage Motora?")
                Image("icon_why_vintage")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(
                            Animation.easeInOut(duration: 2.5)
                                .repeatForever(autoreverses: true)
                        ) {
                            scale = 1.1 // target scale
                        }
                    }
                
            }
        }
        .listStyle(.insetGrouped)
    }
}


#Preview {
    MenuView()
}
