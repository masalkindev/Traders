//
//  CurrencyPairGrigView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct CurrencyPairGrig: Identifiable {
    let id: Int
    let pair: String
    var selected: Bool = false
}

struct CurrencyPairGrigView: View {
    
    let row: CurrencyPairGrig
    
    var body: some View {
        HStack() {
            Spacer()
            Text(row.pair)
                .font(R.font.interSemiBold.font(size: 14))
                .foregroundColor(R.color.textPrimary.color)
                .padding(.leading, 20)
                .padding(.top, 8)
            Spacer()
        }
        .frame(height: 54)
        .background(row.selected ? R.color.green.color : R.color.bgButton.color)
        .cornerRadius(radius: 12)
    }
}

struct CurrencyPairGrigView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyPairGrigView(row: CurrencyPairGrig(id: 0, pair: "GPB/USD"))
    }
}
