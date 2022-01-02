//
//  WebView.swift
//  Hacker News
//
//  Created by Hassan Abdulwahab on 01/01/2022.
//

import Foundation
import WebKit //to use webview
import SwiftUI

//UIViewRepresentable is a wrapper for UIKit View that can be used to integrate UIKit View into a SwiftUI View hierarchy
//to adopt the protocol, makeUIView and updateUIView delegate methods must be created
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView() //create and return a WKWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) { //creat URL from passed url string
                let request = URLRequest(url: url) //create URLRequest from URL
                uiView.load(request) //load URLRequest in WKWebView that was create from makeUIView
            }
        }
    }
    
}
