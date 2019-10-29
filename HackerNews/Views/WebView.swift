//
//  WebView.swift
//  HackerNews
//
//  Created by Evgeniy Uskov on 28.10.2019.
//  Copyright © 2019 Evgeniy Uskov. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrlString = urlString {
            if let safeUrl = URL(string: safeUrlString) {
                let request = URLRequest(url: safeUrl)
                uiView.load(request)
            }
        }
    }
}
