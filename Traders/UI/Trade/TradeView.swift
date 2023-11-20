//
//  TradeView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct TradeView: View {
    var body: some View {
        ZStack() {
            R.color.bgMain.color
                .edgesIgnoringSafeArea(.all)
            VStack() {
                Text("Trade")
            }
        }
        .navigationTitle(R.string.localizable.trade_tilte())
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView()
    }
}
