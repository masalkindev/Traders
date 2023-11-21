//
//  WebView.swift
//  Traders
//
//  Created by Андрей Масалкин on 21.11.2023.
//

import SwiftUI
import WebKit

protocol WebViewAction {
    func didFinishLoading()
}

struct WebView: UIViewRepresentable {
    
    let url: String
    var actionHandler: WebViewAction
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        if let url = URL(string: url) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        
        var control: WebView

        init(_ control: WebView) {
            
            self.control = control
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            control.actionHandler.didFinishLoading()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
        
}
