//
//  TopView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct TopView: View {
    
    @StateObject var viewModel = TopViewModel()
    
    var body: some View {
        ZStack() {
            R.color.bgMain.color
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVStack(spacing: 0) {
                    TraderListHeaderView()
                    ForEach(viewModel.traderRows) { row in
                        TraderRowView(row: row)
                    }
                }
                .padding(.vertical, 14)
                .animation(.default)
                .transition(.opacity)
            }
            .padding(.horizontal, 12)
        }
        .onAppear {
            viewModel.fetchTop()
        }
        .navigationTitle(R.string.localizable.top_tilte())
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
