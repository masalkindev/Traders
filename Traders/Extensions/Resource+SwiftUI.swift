//
//  Resource+SwiftUI.swift
//  Traders
//
//  Created by Андрей Масалкин on 20.11.2023.
//

import RswiftResources
import SwiftUI

extension FontResource {
    func font(size: CGFloat) -> Font {
        Font.custom(name, size: size)
    }
}

extension StringResource {
    var localizedStringKey: LocalizedStringKey {
        LocalizedStringKey(key.description)
    }

    var text: Text {
        Text(localizedStringKey)
    }
}

extension ColorResource {
    var color: Color {
        Color(name)
    }
}

extension ImageResource {
    var image: Image {
        Image(name)
    }
}
