//
//  AnimatedOnScroll.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 11/07/25.
//

import SwiftUI

struct AnimatedOnScroll: ViewModifier {
    @State private var visible = false

    func body(content: Content) -> some View {
        content
            .opacity(visible ? 1 : 0)
            .offset(y: visible ? 0 : 20)
            .animation(.easeOut(duration: 0.6), value: visible)
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onAppear {
                            // Trigger immediately if already visible
                            if geo.frame(in: .global).minY < UIScreen.main.bounds.height {
                                visible = true
                            }
                        }
                        .onChange(of: geo.frame(in: .global).minY) { newY in
                            if newY < UIScreen.main.bounds.height {
                                visible = true
                            }
                        }
                }
            )
    }
}
