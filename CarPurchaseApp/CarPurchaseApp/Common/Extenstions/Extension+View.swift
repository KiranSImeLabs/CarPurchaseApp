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
}
