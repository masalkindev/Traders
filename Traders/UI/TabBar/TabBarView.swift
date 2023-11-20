//
//  TabBarView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                TradeView()
            }
            .tabItem {
                R.image.ic_trade_tab.image
                R.string.localizable.tab_trade_title.text
                    .font(R.font.interSemiBold.font(size: 10))
                    .foregroundColor(R.color.greyDark.color)
            }
            .tag(0)
            NavigationView {
                TopView()
            }
            .tabItem {
                R.image.ic_top_tab.image
                R.string.localizable.tab_top_title.text
                    .font(R.font.interSemiBold.font(size: 10))
                    .foregroundColor(R.color.greyDark.color)
            }
            .tag(1)
        }
        .onAppear {
            appearanceTabBar()
            appearanceNavBar()
        }
        .accentColor(R.color.green.color)
    }
    
    private func appearanceTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = R.color.bgBar()
        appearance.shadowColor = R.color.shadow()
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    private func appearanceNavBar() {
        let navBarAppearence = UINavigationBarAppearance()
        navBarAppearence.configureWithTransparentBackground()
        navBarAppearence.backgroundColor = R.color.bgMain()
        navBarAppearence.shadowImage = UIImage()
        navBarAppearence.titleTextAttributes = [
            .foregroundColor: R.color.textPrimary()!,
            .font: R.font.interBold(size: 22)!
        ]
        UINavigationBar.appearance().standardAppearance = navBarAppearence
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearence
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
