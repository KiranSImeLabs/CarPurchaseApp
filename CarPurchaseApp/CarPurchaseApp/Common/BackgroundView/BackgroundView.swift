//
//  BackgroundView.swift
//  SwiftUICombine
//
//  Created by Simelabs on 10/04/25.
//

import SwiftUI

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor:Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundView(topColor: .indigo, bottomColor: .purple)
}
