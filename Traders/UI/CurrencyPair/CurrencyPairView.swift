//
//  CurrencyPairView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct CurrencyPairView: View {
    
    @EnvironmentObject private var tradeViewModel: TradeViewModel
    
    @StateObject var viewModel = CurrencyPairViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    private let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack() {
            R.color.bgMain.color
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(viewModel.curencyPairGrids) { row in
                        Button {
                            tradeViewModel.selectCurency(pair: row.pair)
                            presentation.wrappedValue.dismiss()
                        } label: {
                            CurrencyPairGrigView(row: row)
                        }
                    }
                }
                .padding(.vertical, 18)
            }
            .padding(.horizontal, 37)
        }
        .onAppear {
            viewModel.fetchCurencyPairs()
        }
        .navigationTitle(R.string.localizable.currency_pair_title())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                BackButtonView {
                    presentation.wrappedValue.dismiss()

                }
        )
    }
}

struct CurrencyPairView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyPairView()
    }
}
