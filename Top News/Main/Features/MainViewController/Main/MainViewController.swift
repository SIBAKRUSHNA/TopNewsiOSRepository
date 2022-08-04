//
//  MainViewController.swift
//  Top News
//
//  Created by Siba Krushna on 03/08/22.
//

import UIKit

class  MainViewController: BaseViewController {
    @IBOutlet weak var newsTableView: NewsTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        callNewsAPI()
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

