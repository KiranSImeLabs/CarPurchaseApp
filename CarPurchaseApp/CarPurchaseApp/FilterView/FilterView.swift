//
//  FilterView.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 27/06/25.
//

import SwiftUI



struct WrapHStack: View {
    let items: [String]
    @Binding var selected: String
    var colors: [String: Color] = [:]
    
    var body: some View {
        FlexibleView(
            availableWidth: UIScreen.main.bounds.width - 30,
            data: items,
            spacing: 5,
            alignment: .leading
        ) { item in
            Button(action: {
                selected = item
            }) {
                HStack {
                    if let color = colors[item] {
                        Circle()
                            .fill(color)
                            .frame(width: 10, height: 10)
                            .shadow(color: .gray, radius: 1.0, y: 1.0)
                    }
                    Text(item)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(selected == item ? Color.black : Color.clear)
                .foregroundColor(selected == item ? .white : .primary)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.5))
                )
            }
        }
    }
}

// Helper for flexible wrapping:
struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content

    init(availableWidth: CGFloat,
         data: Data,
         spacing: CGFloat,
         alignment: HorizontalAlignment,
         @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.availableWidth = availableWidth
        self.data = data
        self.spacing = spacing
        self.alignment = alignment
        self.content = content
    }

    var body: some View {
        var width: CGFloat = 0
        var rows: [[Data.Element]] = [[]]

        for item in data {
            let itemWidth = itemWidth(for: item)
            if width + itemWidth + spacing > availableWidth {
                rows.append([item])
                width = itemWidth + spacing
            } else {
                rows[rows.count - 1].append(item)
                width += itemWidth + spacing
            }
        }

        return VStack(alignment: alignment, spacing: spacing) {
            ForEach(rows.indices, id: \.self) { rowIndex in
                HStack(spacing: spacing) {
                    ForEach(rows[rowIndex], id: \.self) { item in
                        content(item)
                    }
                }
            }
        }
    }

    func itemWidth(for item: Data.Element) -> CGFloat {
        let label = UILabel()
        label.text = "\(item)"
        label.sizeToFit()
        return label.frame.width + 32 // add padding
    }
}
#Preview {
    SearchFilterView(onApply: { val in
        print(val)
        
    }, onReset: {
        print("val")
        
    })
}

