//
//  TradeBalanceView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct TradeBalanceView: View {
    
    let balance: Int
    
    var body: some View {
        HStack(spacing: 7) {
            Spacer()
            VStack(spacing: 7) {
                R.string.localizable.tab_trade_title.text
                    .font(R.font.interMedium.font(size: 12))
                    .foregroundColor(R.color.grey.color)
                Text("\(balance)")
                    .font(R.font.interSemiBold.font(size: 16))
                    .foregroundColor(R.color.textPrimary.color)
            }
            
            Spacer()
        }
        .frame(height: 54)
        .background(R.color.bgButton.color)
        .cornerRadius(radius: 12)
    }
}

struct TradeBalanceView_Previews: PreviewProvider {
    static var previews: some View {
        TradeBalanceView(balance: 10000)
    }
}
