//
//  TopViewModel.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import Foundation
import Combine
import SwiftUI

class TopViewModel: ObservableObject {
    
    @Published private(set) var traderRows: [TraderRow] = []
    
    private var tradersSource: [TraderModel] = []
    
    private var timer: Timer!
    
    init() {
        tradersSource.append(
            TraderModel(country: "031-corsica", name: "Oliver", deposit: 200, profitBased: 422)
        )
        tradersSource.append(
            TraderModel(country: "043-montserrat", name: "Jack", deposit: 156, profitBased: 345)
        )
        tradersSource.append(
            TraderModel(country: "052-kosovo", name: "Harry", deposit: 245, profitBased: 378)
        )
        tradersSource.append(
            TraderModel(country: "063-japan", name: "Jacob", deposit: 367, profitBased: 435)
        )
        tradersSource.append(
            TraderModel(country: "080-iceland", name: "Charley", deposit: 109, profitBased: 290)
        )
        tradersSource.append(
            TraderModel(country: "091-slovakia", name: "Thomas", deposit: 378, profitBased: 307)
        )
        tradersSource.append(
            TraderModel(country: "146-gambia", name: "George", deposit: 147, profitBased: 406)
        )
        tradersSource.append(
            TraderModel(country: "158-egypt", name: "Oscar", deposit: 234, profitBased: 267)
        )
        tradersSource.append(
            TraderModel(country: "166-morocco", name: "James", deposit: 306, profitBased: 426)
        )
        tradersSource.append(
            TraderModel(country: "184-sweden", name: "William", deposit: 189, profitBased: 390)
        )
        for index in 0..<tradersSource.count {
            tradersSource[index].profit = tradersSource[index].profitBased
        }
    }
    
    func fetchTop() {
        updateTraders()
        
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { [weak self] _ in
            self?.updateTraders()
        })
    }
    
    private func updateTraders() {
        
        for index in 0..<tradersSource.count {
            if Int.random(in: 1...10) % (index + 1) > 2 {
                break
            }
            tradersSource[index].profit = tradersSource[index].profitBased + Int.random(in: -150...50)
        }
        
        tradersSource.sort { $0.profit > $1.profit }
        
        traderRows = tradersSource.enumerated().map({
            TraderRow(id: $0 + 1, country: Image($1.country), name: $1.name, deposit: $1.deposit, profit: $1.profit, isLast: $0 == tradersSource.count - 1 )
        })
    }
}
