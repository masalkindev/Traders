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
    @Published var chartUrl: String = "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21"
    @Published var currencyPair: String = "GPB/USD"
    
}

extension TradeViewModel: WebViewAction {
    
    func didFinishLoading() {
        isLoading = false
    }
}
