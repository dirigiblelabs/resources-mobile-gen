//
//  ContentView.swift
//  DirigibleMobile
//
//  Created by Dermendzhiev, Teodor (external - Project) on 21.09.21.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        Webview(url: URL(string: "APP_URL")!)
    }
}

struct Webview: UIViewRepresentable {
    let url: URL

    func makeUIView(context: UIViewRepresentableContext<Webview>) -> WKWebView {
        
        let config = WKWebViewConfiguration()
        let webview = WKWebView(frame: CGRect.zero, configuration: config)
        let request = URLRequest(url: self.url)
        webview.load(request)
        return webview
    }

    func updateUIView(_ webview: WKWebView, context: UIViewRepresentableContext<Webview>) {
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
    }
}
