//
//  LoadingManager.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import Foundation
import Combine
import UserNotifications
import UIKit

class LoadingManager: ObservableObject {
    
    @Published private(set) var progress: Double = 0
    @Published private(set) var loadFinished: Bool = false
    
    var timer: Timer!
    
    func startLoad() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { [weak self] _ in
            guard let self = self else {
                return
            }
            let progress = self.progress == 0 ? Double.random(in: 0.2..<0.25) : Double.random(in: 0.05..<0.25)
            if self.progress + progress >= 1 {
                self.timer.invalidate()
                self.progress = 1
                self.registerForRemoteNotification()
            } else {
                self.progress += progress
            }
        })
    }
    
    private func registerForRemoteNotification() {
        
        UNUserNotificationCenter
            .current()
            .requestAuthorization(
                options: [.alert, .badge, .sound],
                completionHandler: { _, _ in
                    DispatchQueue.main.async {
                        self.loadFinished = true
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                }
            )
    }
}
