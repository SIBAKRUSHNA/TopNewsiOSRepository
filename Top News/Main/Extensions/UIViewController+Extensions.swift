//
//  UIViewController+Extensions.swift
//  Top News
//
//  Created by Mobiotics on 04/08/22.
//

import UIKit
import SafariServices

extension UIViewController {
    // MARK: - Show Loader
    func showLoader(_ color: UIColor = UIColor.black) {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .large)
        spinner.tintColor = color
        spinner.color = color
        spinner.tag = 9_999
        spinner.layer.cornerRadius = 3.0
        spinner.clipsToBounds = true
        spinner.hidesWhenStopped = true
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
    }
    // MARK: - Stop Loader
    func stopLoader() {
        DispatchQueue.main.async {
            if let loader = self.view.viewWithTag(9_999) {
                loader.removeFromSuperview()
            }
        }
    }
    func openWeb(_ url: String?) {
        let webViewController = WebViewController()
        webViewController.stringUrl = url
        if let navigationController = self as? UINavigationController {
            navigationController.pushViewController(webViewController, animated: true)
        } else if let navigationController = self.navigationController {
            navigationController.pushViewController(webViewController, animated: true)
        }
    }
}
