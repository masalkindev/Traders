//
//  UIApplication+Extensions.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
