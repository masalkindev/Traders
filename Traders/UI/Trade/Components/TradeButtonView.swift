//
//  TradeButtonView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct TradeButtonView: View {
    
    let title: String
    let bgColor: Color
    
    var body: some View {
        HStack(spacing: 7) {
            Text(title)
                .font(R.font.interMedium.font(size: 24))
                .foregroundColor(R.color.textPrimary.color)
                .padding(.leading, 20)
                .padding(.top, 8)
            Spacer()
        }
        .frame(height: 54, alignment: .topLeading)
        .background(bgColor)
        .cornerRadius(radius: 12)
    }
}

struct TradeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TradeButtonView(title: "Sell", bgColor: R.color.bgButton.color)
    }
}
