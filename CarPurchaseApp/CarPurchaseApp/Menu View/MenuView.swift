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
    let action: () -> Void
    var body: some View {
        ZStack(alignment: .leading){
            Color.white.opacity(0.1)
            VStack(alignment: .leading){
                HStack {
                    Image(systemName: image)
                        .foregroundColor(Color.init(red: 158.0/255.0, green: 143.0/255.0, blue: 127.0/255.0)) // Icon color

                    Text(text)
                        .foregroundColor(.primary) // Text color
                }
            }
        }
        .onTapGesture {
            action()
        }
    }
}

struct MenuView: View {
//    @State private var scale: CGFloat = 1.0
    @State private var showOverlay = false
    @Environment(\.openURL) var openURL
    
    var body: some View {
        List {
            Section(header: Text("Menu")) {
                ExampleRow(text: "Buy used car", image: "car.fill", action: {
                })
                    .backgroundStyle(.green)
                ExampleRow(text: "Sell car", image: "arrowshape.turn.up.right.fill", action: {
                })
                ExampleRow(text: "Get loans", image: "banknote.fill", action: {
                })
            }
            
            Section(header: Text("Settings")) {
                ExampleRow(text: "Account", image: "person.crop.circle.fill", action: {
                    showOverlay = true
                })
//                    .onTapGesture {
//                        showOverlay = true
//                    }
                ExampleRow(text: "About us", image: "info.circle.fill", action: {
                    openURL(URL(string: "http://192.168.0.72:8080")!)
                })
                ExampleRow(text: "Privacy Policy", image: "lock.shield.fill", action: {
                    openURL(URL(string: "http://192.168.0.72:8080")!)
                })
                ExampleRow(text: "Terms", image: "doc.text.fill", action: {
                    openURL(URL(string: "http://192.168.0.72:8080")!)
                })
                ExampleRow(text: "Contact", image: "phone.fill", action: {
                    openURL(URL(string: "http://192.168.0.72:8080")!)
                })
            }
            
            Section(header: Text("")) {
                ZStack{
                    Rectangle().frame(height: 200)
                        .overlay(
                            LinearGradient(colors: [AppColorConstants.gradientColor3,AppColorConstants.gradientColor2,AppColorConstants.gradientColor2], startPoint: .top, endPoint: .bottom)
                            
                            
                        )
                    Text("Explore timeless vintage cars from across Australia.")
                        .font(.custom("SnellRoundhand", size: 25))
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    
            
                }
                
                
                    .listRowInsets(EdgeInsets())
            }
            
        }
        .listStyle(.insetGrouped)
        .sheet(isPresented: $showOverlay) {
            LoginView()
        }
    }
}


#Preview {
    MenuView()
}
