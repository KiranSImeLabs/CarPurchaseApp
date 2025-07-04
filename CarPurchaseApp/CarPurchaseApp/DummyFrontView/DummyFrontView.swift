//
//  DummyFrontView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 25/06/25.
//

import SwiftUI

struct DummyFrontView: View {
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            
            NavigationStack() {
                HomeView()
                    .ignoresSafeArea()
                Spacer()
            }
            .toolbar(.hidden, for: .navigationBar)
            .tint(AppColorConstants.primaryColor)
            .tabItem {
                Text("Home")
                Image(systemName: "house.fill")
                    .renderingMode(.template)
            }
            .tag(0)

            
            NavigationStack() {
                CarSearchView()
            }
            .tint(AppColorConstants.primaryColor)
            .tabItem {
                Label("Browse", systemImage: "magnifyingglass")
            }
            .tag(1)
            
            NavigationStack() {
                MenuView()
            }
            .tint(AppColorConstants.primaryColor)
            .tabItem {
                Text("Menu")
                Image(systemName: "line.3.horizontal")
                
            }
//            .badge("12")
            .tag(2)
            
        }//TabView
        .tint(AppColorConstants.primaryColor)
        .onAppear(perform: {
            
            UITabBar.appearance().barTintColor = UIColor.white
            
            UITabBar.appearance().unselectedItemTintColor = UIColor(AppColorConstants.secondaryColor)
            
            UITabBarItem.appearance().badgeColor = .blue
            
            UITabBar.appearance().backgroundColor = .white//.systemGray4.withAlphaComponent(0.4)
            
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemPink]
            //UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
            //Above API will kind of override other behaviour and bring the default UI for TabView
        })
//        .ignoresSafeArea()
    }
}

#Preview {
    DummyFrontView()
}
