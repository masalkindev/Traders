//
//  TradeInputView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct TradeInputView: View {
    
    let title: String
    @Binding var text: String
    
    @State private var showClear: Bool = false
    @State private var changed: Bool = false
    
    var body: some View {
        VStack(spacing: 7) {
            let validatingText = Binding<String>(
                get: { text },
                set: {
                    text = $0
                    showClear = changed && !$0.isEmpty
                }
            )
            HStack() {
                Spacer()
                Text(title)
                    .font(R.font.interMedium.font(size: 12))
                    .foregroundColor(R.color.grey.color)
                Spacer()
            }
            HStack() {
                Button {
                    decrement()
                } label: {
                    R.image.minusCirlce.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                }
                .padding(.leading, 15)
                Spacer()
                TextField("", text: validatingText) { value in
                    changed = value
                }
                .font(R.font.interBold.font(size: 16))
                .foregroundColor(R.color.textPrimary.color)
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
                Spacer()
                Button {
                    increment()
                } label: {
                    R.image.addCircle.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                }
                .padding(.trailing, 15)
            }
        }
        .frame(height: 54)
        .background(R.color.bgButton.color)
        .cornerRadius(radius: 12)
    }
    
    private func increment() {
        let value = Int(text) ?? 0
        text = "\(value + 1)"
    }
    private func decrement() {
        let value = Int(text) ?? 0
        text = "\(value - 1)"
    }
}

struct TradeInputView_Previews: PreviewProvider {
    @State private static var text: String = "00:00"
    static var previews: some View {
        TradeInputView(title: "Timer", text: $text)
    }
}
