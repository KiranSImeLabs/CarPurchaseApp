//
//  PriceSliderView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 27/06/25.
//

import SwiftUI

struct PriceSliderView: View {
    @Binding var value: Int
    let minValue: CGFloat
    let maxValue: CGFloat
    
    var body: some View {
        VStack {
            // Custom slider
            GeometryReader { geometry in
                let sliderWidth = geometry.size.width
                let thumbSize: CGFloat = 28
                let progress = (CGFloat(value) - minValue) / (maxValue - minValue)
                let xOffset = progress * (sliderWidth - thumbSize)
                
                ZStack(alignment: .leading) {
                    // Track (gray background)
                    Capsule()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 6)
                    
                    // Filled portion (black track)
                    Capsule()
                        .fill(Color.black)
                        .frame(width: xOffset + thumbSize / 2, height: 6)
                    
                    // Thumb
                    Circle()
                        .fill(Color.black)
                        .frame(width: thumbSize, height: thumbSize)
                        .offset(x: xOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    let location = gesture.location.x
                                    let newValue = min(max(location / (sliderWidth - thumbSize), 0), 1)
                                    value = Int(minValue + newValue * (maxValue - minValue))
                                }
                        )
                }
            }
            .frame(height: 40)
            
            // Labels
            HStack {
                Text("\(minValue)")
                Spacer()
                Text("\(maxValue)")
            }
            .padding(.horizontal)
            .font(.subheadline)
            .foregroundColor(.gray)
            
            Text(verbatim: "\($value.wrappedValue)")
        }
        .padding()
    }
}

#Preview {
    PriceSliderView(value: .constant(250), minValue: 200.0, maxValue: 3000.0)
}
