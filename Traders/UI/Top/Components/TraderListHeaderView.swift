//
//  TraderListHeaderView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct TraderListHeaderView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            R.string.localizable.top_column_number.text
                .font(R.font.interMedium.font(size: 12))
                .foregroundColor(R.color.greyLight.color)
                .padding(.leading, 9)
                .padding(.trailing, 14)
            R.string.localizable.top_column_country.text
                .font(R.font.interMedium.font(size: 12))
                .foregroundColor(R.color.greyLight.color)
                .padding(.trailing, 40)
            R.string.localizable.top_column_name.text
                .font(R.font.interMedium.font(size: 12))
                .foregroundColor(R.color.greyLight.color)
            Spacer(minLength: 6)
            R.string.localizable.top_column_deposit.text
                .font(R.font.interMedium.font(size: 12))
                .foregroundColor(R.color.greyLight.color)
            R.string.localizable.top_column_profit.text
                .font(R.font.interMedium.font(size: 12))
                .foregroundColor(R.color.greyLight.color)
                .frame(minWidth: 53, alignment: .trailing)
                .padding(.trailing, 9)
                .padding(.leading, 20)
        }
        .frame(height: 50)
        .background(R.color.bgRow.color)
        .cornerRadius(radius: 9, corners: [.topLeft, .topRight])
    }
}

struct TraderListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TraderListHeaderView()
    }
}
