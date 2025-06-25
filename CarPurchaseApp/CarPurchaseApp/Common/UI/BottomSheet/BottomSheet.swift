//
//  BottomSheetViewController.swift
//
//
//  Created by Simelabs on 26/06/25.
//

import SwiftUI

struct BottomSheet<Content: View>: View {
    @Binding var isPresented: Bool
    let minTopSpacing: CGFloat = 80
    let minDismissiblePanHeight: CGFloat = 20
    let content: Content

    @GestureState private var dragOffset: CGFloat = 0

    init(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.content = content()
    }

    var body: some View {
        if isPresented {
            ZStack(alignment: .bottom) {
                Color.black.opacity(0.8)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isPresented = false
                        }
                    }
                
                sheetView
                    .transition(.move(edge: .bottom))
                    .offset(y: dragOffset > 0 ? dragOffset : 0)
                    .gesture(
                        DragGesture()
                            .updating($dragOffset) { value, state, _ in
                                if value.translation.height > 0 {
                                    state = value.translation.height
                                }
                            }
                            .onEnded { value in
                                if value.translation.height > minDismissiblePanHeight {
                                    withAnimation {
                                        isPresented = false
                                    }
                                }
                            }
                    )
            }
            .animation(.easeInOut, value: isPresented)
        }
    }

    private var sheetView: some View {
        VStack(spacing: 0) {
            topBar
            content
                .padding(.horizontal, 5)
                .padding(.bottom, 32)
        }
        .background(.background)
        .cornerRadius(40, corners: [.topLeft, .topRight])
    }

    private var topBar: some View {
        VStack {
            Capsule()
                .fill(Color.gray)
                .frame(width: 40, height: 6)
                .padding(.top, 8)
            Spacer().frame(height: 16)
        }
        .frame(height: 54)
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


#Preview {
    BottomSheet(isPresented: .constant(true)) {
        CarListView()
    }
}
