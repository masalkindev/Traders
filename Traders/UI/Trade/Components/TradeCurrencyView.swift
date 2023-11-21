//
//  TradeCurrencyView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct TradeCurrencyView: View {
    
    let currency: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            HStack() {
                Spacer()
                Text(currency)
                    .font(R.font.interSemiBold.font(size: 16))
                    .foregroundColor(R.color.textPrimary.color)
                Spacer()
            }
            .frame(height: 54)
            .background(R.color.bgButton.color)
            .cornerRadius(radius: 12)
            
            R.image.arrowLeft.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .padding(.trailing, 11)
        }
    }
}

struct TradeCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        TradeCurrencyView(currency: "GPB/USD")
    }
}
