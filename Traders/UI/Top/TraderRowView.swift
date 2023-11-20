//
//  TraderRowView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct TraderRow: Identifiable {
    let id: Int
    let country: Image
    let name: String
    let deposit: Int
    let profit: Int
    let isLast: Bool
    var background: Color {
        if id % 2 == 0 {
            return R.color.bgRow.color
        } else {
            return Color.clear
        }
    }
}

struct TraderRowView: View {
    
    let row: TraderRow
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text("\(row.id)")
                .font(R.font.interMedium.font(size: 14))
                .foregroundColor(R.color.greyLight.color)
                .frame(minWidth: 28, alignment: .leading)
                .padding(.leading, 9)
                .padding(.trailing, 2)
            row.country
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 26, height: 26)
                .padding(.trailing, 42)
            Text(row.name)
                .font(R.font.interMedium.font(size: 14))
                .foregroundColor(R.color.textPrimary.color)
            Spacer(minLength: 14)
            Text("$\(row.deposit)")
                .font(R.font.interMedium.font(size: 14))
                .foregroundColor(R.color.textPrimary.color)
            Text("$\(row.profit)")
                .font(R.font.interMedium.font(size: 14))
                .foregroundColor(R.color.green.color)
                .frame(minWidth: 72, alignment: .trailing)
                .padding(.trailing, 9)
                .padding(.leading, 14)
        }
        .frame(height: 50)
        .background(row.background)
        .cornerRadius(radius: row.isLast ? 9 : 0, corners: [.bottomLeft, .bottomRight])
        
    }
}

struct TraderRowView_Previews: PreviewProvider {
    static var previews: some View {
        TraderRowView(row: TraderRow(id: 2, country: Image("080-iceland"), name: "Oliver", deposit: 245, profit: 123, isLast: true))
    }
}
