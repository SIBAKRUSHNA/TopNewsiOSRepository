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
        self.view.backgroundColor = .white
    }
}

