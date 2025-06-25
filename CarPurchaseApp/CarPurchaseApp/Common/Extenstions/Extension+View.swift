//
//  Extension+View.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 24/06/25.
//

import SwiftUI

extension View {
    func filterButtonStyle(selected: Bool) -> some View {
        self
            .padding(8)
            .background(selected ? Color.accentColor : Color(.secondarySystemBackground))
            .foregroundColor(selected ? .white : .primary)
            .cornerRadius(8)
    }
    
    // View extension for corner radius on specific corners
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func toast(isPresented: Binding<Bool>,
               message: String,
               duration: TimeInterval = 2.0,
               backgroundColor: Color = .black,
               textColor: Color = .white) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented,
                                    message: message,
                                    duration: duration,
                                    backgroundColor: backgroundColor,
                                    textColor: textColor))
    }
    
}
