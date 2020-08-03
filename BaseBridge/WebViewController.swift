//
//  WebViewController.swift
//  BaseBridge
//
//  Created by sxh on 2020/7/31.
//  Copyright © 2020 yuxin. All rights reserved.
//

import UIKit
import WebKit
import JavaScriptCore

class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    var wkWebview: WKWebView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wkWebview = WKWebView(frame: self.view.bounds)
        
        self.view.addSubview(wkWebview!)
        wkWebview?.uiDelegate = self
        wkWebview?.navigationDelegate = self
        wkWebview?.load(URLRequest(url: URL(string: "http://192.168.0.101:9528/")!))
    }
    
    // 页面开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    // 页面内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    // 页面加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    // 页面加载失败时调用
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
    }
    // 页面接收到服务器跳转请求之后调用
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
    // 在收到响应后，决定是否跳转
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    // 在发送请求前，决定是否跳转
    @available(iOS 13.0, *)
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
        
        decisionHandler(.allow, WKWebpagePreferences())
    }
    
}
