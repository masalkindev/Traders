//
//  CurrencyPairViewModel.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import Foundation
import Combine
import SwiftUI

class CurrencyPairViewModel: ObservableObject {
    
    @Published private(set) var curencyPairGrids: [CurrencyPairGrig] = []
    
    private var curencyPairSource: [CurencyPairModel] = []
    
    init() {
        
        for index in 0..<14 {
            let value = Int.random(in: 1...10) % (index + 1) > 2 ? "EUR/USD" : "GPB/USD"
            curencyPairSource.append(CurencyPairModel(value: value))
        }
    }
    
    func fetchCurencyPairs() {
        curencyPairGrids = curencyPairSource.enumerated().map({
            CurrencyPairGrig(id: $0, pair: $1.value, selected: $0 == 1)
        })
    }
}
