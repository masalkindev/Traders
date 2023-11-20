//
//  LaunchView.swift
//  Traders
//
//  Created by Андрей Масалкин on 20.11.2023.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject private var loadingManager: LoadingManager
    
    var body: some View {
        ZStack(alignment: .center) {
            R.color.bgMain.color
                .edgesIgnoringSafeArea(.all)
            R.image.preloader_blur.image
                .resizable()
                .aspectRatio(contentMode: .fill)
            if loadingManager.progress < 1 {
                ProgressView(value: loadingManager.progress, total: 1) {
                    Text("\(Int(loadingManager.progress * 100))%")
                        .font(R.font.interExtraBold.font(size: 16))
                        .foregroundColor(R.color.textPrimary.color)
                }
                .progressViewStyle(
                    RoundedProgressViewStyle(
                        trackColor: R.color.bgGray.color,
                        progressColor: R.color.green.color,
                        width: 300)
                )
                .padding(.horizontal, 37)
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .environmentObject(LoadingManager())
    }
}
