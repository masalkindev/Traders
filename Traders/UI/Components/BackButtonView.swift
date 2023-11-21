//
//  BackButtonView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct BackButtonView: View {
    
    var onAction: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            R.image.arrowLeft.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(R.color.textPrimary.color)
            Text("    ")
        }
        .onTapGesture {
            onAction()
        }
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView { }
    }
}

