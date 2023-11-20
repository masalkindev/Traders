//
//  TradersApp.swift
//  Traders
//
//  Created by Андрей Масалкин on 20.11.2023.
//

import SwiftUI

@main
struct TradersApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var loadingManager = LoadingManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                TabBarView()
                
                if !loadingManager.loadFinished {
                    LaunchView()
                        .animation(.default)
                        .transition(.opacity)
                }
            }
            .onAppear {
                loadingManager.startLoad()
            }
            .environmentObject(loadingManager)
        }
    }
}
