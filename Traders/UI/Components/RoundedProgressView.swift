//
//  RoundedProgressView.swift
//  Traders
//
//  Created by Андрей Масалкин on 20.11.2023.
//

import SwiftUI

struct RoundedProgressViewStyle: ProgressViewStyle {
    
    let trackColor: Color
    let progressColor: Color
    let width: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0.0
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12.0)
                .fill(trackColor)
                .frame(width: width, height: 24)
            RoundedRectangle(cornerRadius: 12)
                .fill(progressColor)
                .frame(width: CGFloat(progress) * width, height: 24)
        }
        .frame(width: width, height: 24)
        .overlay(configuration.label)
            
    }
}
