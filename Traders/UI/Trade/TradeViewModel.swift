//
//  TradeViewModel.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import Foundation
import Combine
import SwiftUI

class TradeViewModel: ObservableObject {
    
    @Published private(set) var balance: Int = 10000
    @Published var isLoading: Bool = true
    @Published var chartUrl: String = "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP"
    @Published var currencyPair: String = "GPB/USD"
    
    func selectCurency(pair: String) {
        currencyPair = pair
        if pair == "GPB/USD" {
            chartUrl = "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP"
        } else {
            chartUrl = "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21"
        }
    }
    
}

extension TradeViewModel: WebViewAction {
    
    func didFinishLoading() {
        isLoading = false
    }
}
