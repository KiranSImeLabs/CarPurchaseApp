//
//  SplashView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//
import SwiftUI

struct SplashView: View {
    @Binding var isActive: Bool

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                HStack(spacing: 16.0){
                    LottieView(animationName: "car_splash", loopMode: .playOnce)
//                        .frame(width: 200, height: 200)
                        .padding(20)
                }
                
                Text("CarZilla")
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

