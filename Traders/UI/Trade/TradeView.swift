//
//  TradeView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct TradeView: View {
    
    @StateObject var viewModel = TradeViewModel()
    
    @State private var timerText: String = "00:00"
    @State private var investmentText: String = "1000"
    
    var body: some View {
        ZStack() {
            R.color.bgMain.color
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                GeometryReader { proxy in
                    ScrollView {
                        VStack(spacing: 0) {
                            TradeBalanceView(balance: viewModel.balance)
                                .padding(.horizontal, 30)
                                .padding(.bottom, 25)
                            ZStack() {
                                WebView(url: viewModel.chartUrl, actionHandler: viewModel)
                                    .background(Color.clear)
                                    .frame(height: proxy.frame(in: .global).height - 54)
                                if viewModel.isLoading {
                                    ProgressView()
                                }
                            }
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { _ in
                                UIApplication.shared.endEditing()
                            }
                    )
                }
                VStack(spacing: 0) {
                    NavigationLink {
                        CurrencyPairView(
                            viewModel:
                                CurrencyPairViewModel(
                                    selectedId: viewModel.currencyPairId
                                )
                        )
                        .environmentObject(viewModel)
                    } label: {
                        TradeCurrencyView(currency: viewModel.currencyPair)
                    }
                    HStack(spacing: 11) {
                        TradeInputView(title: R.string.localizable.trade_timer(), text: $timerText)
                        TradeInputView(title: R.string.localizable.trade_investment(), text: $investmentText)
                    }
                    .padding(.top, 10)
                    HStack(spacing: 11) {
                        Button {
                        } label: {
                            TradeButtonView(
                                title: R.string.localizable.trade_sell(),
                                bgColor: R.color.red.color
                            )
                        }
                        Button {
                        } label: {
                            TradeButtonView(
                                title: R.string.localizable.trade_buy(),
                                bgColor: R.color.green.color
                            )
                        }
                    }
                    .padding(.top, 10)
                    
                }
                .background(R.color.bgMain.color)
                .padding(.horizontal, 30)
                .padding(.top, 16)
                .padding(.bottom, 12)
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
