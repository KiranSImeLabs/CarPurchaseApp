//
//  PerformanceStatView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 26/06/25.
//

import SwiftUI

struct PerformanceStatView: View {
    let value: String
    let unit: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text(value)
                    .font(.headline)
                    .bold()
                Text(" " + unit)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Text(label)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .frame(minWidth: 80)
    }
}

#Preview {
    PerformanceStatView(value: "100", unit: "ksdflks", label: "sdnfsdf")
}
