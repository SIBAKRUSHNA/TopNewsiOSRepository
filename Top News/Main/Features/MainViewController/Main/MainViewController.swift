//
//  MainViewController.swift
//  Top News
//
//  Created by Siba Krushna on 03/08/22.
//

import UIKit

class  MainViewController: UIViewController {
    @IBOutlet weak var newsTableView: NewsTableView!
    private var refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        callNewsAPI()
        pullToRefresh()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    private func setData() {
        newsTableView.returnURL = { [weak self] (url) in
            self?.openWeb(url)
        }
    }
    private func pullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        newsTableView.addSubview(refreshControl)
    }
    @objc func refresh(_ sender: AnyObject) {
        callNewsAPI()
        refreshControl.endRefreshing() // End Refreshing
    }
    private func callNewsAPI() {
        self.showLoader()
        APIHandler.shared.callNewsAPI { [weak self] (response) in
            DispatchQueue.main.async {
                self?.newsTableView.setData(response.articles)
            }
            self?.stopLoader()
        }
    }
}

