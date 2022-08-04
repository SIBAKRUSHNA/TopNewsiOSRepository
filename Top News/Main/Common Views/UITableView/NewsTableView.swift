//
//  NewsTableView.swift
//  Top News
//
//  Created by Siba Krushna on 04/08/22.
//

import UIKit

class NewsTableView: UITableView {
    private var articles = [Articles]()
    var returnURL: ((String?) -> Void)?
    // MARK: - Life Cycle
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.configTableView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configTableView()
    }
    private func configTableView() {
        self.backgroundColor = UIColor.white
        self.delegate = self
        self.dataSource = self
        register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }
    func setData(_ newsData: [Articles]?) {
        articles = newsData ?? []
        reloadData()
    }
}
extension NewsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell()}
        cell.setData(articles[indexPath.row])
        return cell
    }
}
extension NewsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        returnURL?(articles[indexPath.row].url)
    }
}
