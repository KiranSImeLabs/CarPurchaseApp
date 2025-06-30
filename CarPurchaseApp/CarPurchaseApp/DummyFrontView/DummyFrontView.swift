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
                HomeViewDummy(tabSelection: $selectedIndex)
                    .ignoresSafeArea()
                Spacer()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .tabItem {
                Text("Home view")
                Image(systemName: "house.fill")
                    .renderingMode(.template)
            }
            .tag(0)

            
            NavigationStack() {
                CarSearchView()
            }
            .tabItem {
                Label("Browse", systemImage: "magnifyingglass")
            }
            .tag(1)
            
            NavigationStack() {
                Text("Account view")
                    .navigationTitle("Account")
                
            }
            .tabItem {
                Text("Account")
                Image(systemName: "person.crop.circle")
                
            }
//            .badge("12")
            .tag(2)
            
        }//TabView
        .tint(.blue)
        .onAppear(perform: {
            
            UITabBar.appearance().barTintColor = UIColor.white
            
            UITabBar.appearance().unselectedItemTintColor = .gray
            
            UITabBarItem.appearance().badgeColor = .blue
            
            UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.4)
            
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
