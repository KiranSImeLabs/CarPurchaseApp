//
//  BRToast.swift
//  CarPurchase
//
//  Created by Simelabs on 23/06/25.
//

import SwiftUI

/// SwiftUI-compatible Toast View
struct ToastView: View {
    let message: String
    let backgroundColor: Color
    let textColor: Color

    var body: some View {
        Text(message)
            .multilineTextAlignment(.center)
            .foregroundColor(textColor)
            .padding()
            .background(backgroundColor.opacity(1.0))
            .cornerRadius(25)
            .padding(.horizontal, 30)
    }
}

/*
 ViewModifier is a protocol in SwiftUI that lets you encapsulate and reuse custom view transformations.
 */
/// Toast presenter view modifier
struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    let message: String
    let duration: TimeInterval
    let backgroundColor: Color
    let textColor: Color

    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                VStack {
                    Spacer()
                    ToastView(message: message, backgroundColor: backgroundColor, textColor: textColor)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                                withAnimation {
                                    isPresented = false
                                }
                            }
                        }
                }
                .padding(.bottom, 20)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: isPresented)
    }
}


/*
 Usage:
 struct ContentView: View {
     @State private var showToast = false

     var body: some View {
         VStack {
             Button("Show Toast") {
                 withAnimation {
                     showToast = true
                 }
             }
         }
         .toast(isPresented: $showToast, message: "Hello from SwiftUI!")
     }
 }
 */


#Preview {
    VStack {
    }
    .toast(isPresented: .constant(true), message: "Hello from SwiftUI!")
    .background(BackgroundView(topColor: .blue, bottomColor: .green))
    .padding(0)
}
