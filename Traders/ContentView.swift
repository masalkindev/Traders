//
//  ContentView.swift
//  Traders
//
//  Created by Андрей Масалкин on 20.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(R.string.localizable.top_tilte())
                .font(R.font.interMedium.font(size: 12))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
