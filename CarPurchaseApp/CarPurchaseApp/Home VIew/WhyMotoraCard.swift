//
//  WhyMotoraCard.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 03/07/25.
//

import SwiftUI

import SwiftUI

struct WhyMotoraCard: View {
    let text:String
    let subText:String
    let cardImage:String
    var body: some View {
        VStack(spacing: 8) {
            // Car icon placeholder
            Image(cardImage) // Replace with your custom image if needed
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.gray.opacity(0.6))

            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.black)

            Text(subText)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

struct WhyMotoraCard_Previews: PreviewProvider {
    static var previews: some View {
        WhyMotoraCard(text: "All Styles. One Place", subText: "All Styles. One Place", cardImage: "why_1")
    }
}
