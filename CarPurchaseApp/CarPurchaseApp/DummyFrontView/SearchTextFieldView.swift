//
//  SearchTextFieldView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 26/06/25.
//

import SwiftUI

struct SearchTextField: View {
    @Binding var text: String
//    @Binding var isFocusOn:Bool = false
    
    var isText: Bool = true
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .fill(Color.white)
                .frame(height: 50)
                .shadow(color: .gray, radius: 1.0)
            TextField("Search cars...", text: $text)
                .padding(.leading,20)
//                .cornerRadius(10)
                .allowsHitTesting(isText)
        }
    }
}

#Preview {
    SearchTextField(text: .constant(""))
}
