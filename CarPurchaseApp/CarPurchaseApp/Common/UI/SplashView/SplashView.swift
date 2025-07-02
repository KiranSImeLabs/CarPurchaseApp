//
//  SplashView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//
import SwiftUI
import Lottie

struct SplashView: View {
    @Binding var isActive: Bool
    var loopMode:LottieLoopMode = .playOnce
    var body: some View {
        ZStack {
            AppColorConstants.primaryColor.ignoresSafeArea()
            
            VStack {
                LottieView(animationName: "car_splash", loopMode: loopMode)
                    .padding(20)
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    isActive = false
                }
            }
        }
    }
}


#Preview {
    SplashView(isActive: .constant(true),loopMode: .loop)
}
