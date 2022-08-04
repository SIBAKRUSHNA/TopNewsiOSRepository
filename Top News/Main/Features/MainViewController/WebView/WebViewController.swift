//
//  WebViewController.swift
//  Top News
//
//  Created by Mobiotics on 04/08/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var webView: WKWebView!
    var stringUrl: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadWebPage()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.stopLoader()
    }
    func setUI() {
        super.view.backgroundColor = .white
        let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: self.view.frame , configuration: webConfiguration)
        webView.backgroundColor = .white
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.frame = self.view.bounds
        self.webView.navigationDelegate = self
        self.view.addSubview(webView)
        let guide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint(item: webView!, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: webView!, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        webView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    private func loadWebPage() {
        guard let url = self.stringUrl, let url = URL(string: url) else { return }
        webView.load(URLRequest(url: url))
    }
}
extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.stopLoader()
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.showLoader()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.stopLoader()
    }
}

