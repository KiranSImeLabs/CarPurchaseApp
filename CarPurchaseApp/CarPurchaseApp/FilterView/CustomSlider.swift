//
//  CustomSlider.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 30/06/25.
//


import SwiftUI

struct RangeSlider: View {
    let currentValue: Binding<ClosedRange<Float>>
    var sliderBounds: ClosedRange<Int>
    
    public init(value: Binding<ClosedRange<Float>>, bounds: ClosedRange<Int> = 100...1000) {
        self.currentValue = value
        self.sliderBounds = bounds
    }
    
    var body: some View  {
        VStack(spacing: 4) {
            GeometryReader { geometry in
                sliderView(sliderSize: geometry.size,
                           sliderViewYCenter: geometry.size.height / 2)
            }
            .frame(height: 28)
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder private func sliderView(sliderSize: CGSize, sliderViewYCenter: CGFloat) -> some View {
        trackView(
            from: leftThumbLocation(
                width: sliderSize.width,
                sliderViewYCenter: sliderViewYCenter
            ),
            to: rightThumbLocation(
                width: sliderSize.width,
                sliderViewYCenter: sliderViewYCenter
            )
        )
        
        thumbView(
            position: leftThumbLocation(
                width: sliderSize.width,
                sliderViewYCenter: sliderViewYCenter
            )
        )
        .highPriorityGesture(DragGesture().onChanged { dragValue in
            let newValue = newThumbLocation(dragLocation: dragValue.location,
                                                      width: sliderSize.width)
            
            if newValue < currentValue.wrappedValue.upperBound {
                currentValue.wrappedValue = newValue...currentValue.wrappedValue.upperBound
            }
        })
        
        thumbView(
            position: rightThumbLocation(
                width: sliderSize.width,
                sliderViewYCenter: sliderViewYCenter
            )
        )
        .highPriorityGesture(DragGesture().onChanged { dragValue in
            let newValue = newThumbLocation(dragLocation: dragValue.location,
                                                      width: sliderSize.width)
            
            if newValue > currentValue.wrappedValue.lowerBound {
                currentValue.wrappedValue = currentValue.wrappedValue.lowerBound...newValue
            }
        })
    }
    
    @ViewBuilder func trackView(from: CGPoint, to: CGPoint) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .frame(height: 8)
                .foregroundColor(Color.gray.opacity(0.3))
            
            
            Path { path in
                path.move(to: from)
                path.addLine(to: to)
            }
            .stroke(Color.black,lineWidth: 8)
        }
    }
    
    @ViewBuilder func thumbView(position: CGPoint) -> some View {
        Circle()
            .frame(width: 18, height: 18)
            .foregroundColor(Color.black)
            .padding(.vertical, 16)
            .background(
                Circle().stroke(Color.white , style: StrokeStyle(lineWidth: 4))
            )
            .contentShape(Rectangle())
            .shadow(color: Color.black.opacity(0.16), radius: 8)
            .position(x: position.x, y: position.y)
    }
    
    func leftThumbLocation(width: CGFloat, sliderViewYCenter: CGFloat = 0) -> CGPoint {
        let sliderLeftPosition = CGFloat(currentValue.wrappedValue.lowerBound - Float(sliderBounds.lowerBound))
        return .init(x: sliderLeftPosition * stepWidthInPixel(width: width),
                     y: sliderViewYCenter)
    }
    
    func rightThumbLocation(width: CGFloat, sliderViewYCenter: CGFloat = 0) -> CGPoint {
        let sliderRightPosition = CGFloat(currentValue.wrappedValue.upperBound - Float(sliderBounds.lowerBound))
        
        return .init(x: sliderRightPosition * stepWidthInPixel(width: width),
                     y: sliderViewYCenter)
    }
    
    func newThumbLocation(dragLocation: CGPoint, width: CGFloat) -> Float {
        let xThumbOffset = min(max(0, dragLocation.x), width)
        return Float(sliderBounds.lowerBound) + Float(xThumbOffset / stepWidthInPixel(width: width))
    }
    
    private func stepWidthInPixel(width: CGFloat) -> CGFloat {
        width / CGFloat(sliderBounds.count - 1)
    }
}

struct RangeSliderDemo: View {
    @State var rateRange: ClosedRange<Float> = 50...120
    let rangeBound: ClosedRange<Int> = 25...200
    var body: some View {
        VStack {
            Text("Start Value: \(Int(rateRange.lowerBound))")
            Text("End Value: \(Int(rateRange.upperBound))")
            RangeSlider(value: $rateRange, bounds: rangeBound)
                .padding(.horizontal)
            HStack {
                Text(rangeBound.lowerBound.description)
                Spacer()
                Text(rangeBound.upperBound.description)
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    RangeSliderDemo()
}
