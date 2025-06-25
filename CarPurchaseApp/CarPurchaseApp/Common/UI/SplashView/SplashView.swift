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
            Color.brown.ignoresSafeArea()
            
            VStack {
                HStack(spacing: 16.0){
                    LottieView(animationName: "car_splash", loopMode: loopMode)
                        .padding(20)
                }
                
                Text("Let's try a ride ........")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 20)
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
