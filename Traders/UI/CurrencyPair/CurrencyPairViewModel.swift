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
    
    private var selectedId: Int
    
    init(selectedId: Int) {
        self.selectedId = selectedId
        for index in 0..<14 {
            if index == 0 {
                curencyPairSource.append(CurencyPairModel(id: 0, value: "GPB/USD"))
                continue
            }
            let value = Int.random(in: 1...10) % (index + 1) > 2 ? "EUR/USD" : "GPB/USD"
            curencyPairSource.append(CurencyPairModel(id: index, value: value))
        }
    }
    
    func fetchCurencyPairs() {
        curencyPairGrids = curencyPairSource.enumerated().map({
            CurrencyPairGrig(id: $1.id, pair: $1.value, selected: $1.id == selectedId)
        })
    }
}
