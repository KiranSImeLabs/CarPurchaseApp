//
//  LoginView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 07/07/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack{
            Color.white
            
//            VStack(spacing: 0) {
//                
//
//                
//                Spacer()
//            }
            VStack(spacing: 0){
                //MARK: - Header
                HStack(spacing: 0){
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(AppColorConstants.secondaryColor)
                            .frame(width: 120,height: 90)
                        Image("Logo")
                            .resizable()
                            .frame(width: 88,height: 15)
                            .scaledToFit()
                            .padding(.bottom,20)
                            .clipped()
                        
                    }
                    Rectangle()
                        .fill(.white)
                        .frame(height: 90) // Adjust height as needed
                    
                }
                
                //MARK: - Banner Image
                
                Image("Banner")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                
                Spacer()
            }
            .background(
                LinearGradient(colors: [.white,AppColorConstants.secondaryColor.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomLeading)
            )
            
            VStack{
                Spacer()
                Spacer()
                // ✅ Main Content
                VStack(spacing: 15) {
                    SearchTextField(text: $viewModel.userEmail, placeHolder: "Enter email")
                        .border(AppColorConstants.primaryColor, width: viewModel.isEmailValid ? 0 : 1.0)
                    
                    SearchTextField(text: $viewModel.userPassword, placeHolder: "Enter password")
                        .border(AppColorConstants.primaryColor, width: viewModel.isPasswordValid ? 0 : 1.0)
                    
                    Button(action: {
                        print("Button clicked")
                    }) {
                        Label("Sign In", systemImage: "person.badge.key")
                    }
                    .buttonStyle(PrimaryButtonStyle(color: AppColorConstants.primaryColor,cornerRad: 0))
                    .disabled(!viewModel.isSignInEnable)
                    .opacity(buttonOpacity)
                    
                }
                .padding(.horizontal,10)
                
                Spacer()
            }
            .onAppear {
                DispatchQueue.main.async {
                    // ========== Only first time
                    viewModel.isEmailValid = true
                    viewModel.isPasswordValid = true
                    //==========
                }
                
            }
                
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.top) // Make the banner go under safe area
    }
    
    var buttonOpacity: Double {
        return viewModel.isSignInEnable ? 1 : 0.5
    }
}

#Preview {
    LoginView()
}
