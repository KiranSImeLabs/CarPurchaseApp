//
//  MainViewSwitcher.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//

import SwiftUI
struct MainViewSwitcher: View {
    @State private var showSplash = true

    var body: some View {
        Group {
            if showSplash {
                SplashView(isActive: $showSplash)
            } else {
                CarListView()
            }
        }
    }
}
