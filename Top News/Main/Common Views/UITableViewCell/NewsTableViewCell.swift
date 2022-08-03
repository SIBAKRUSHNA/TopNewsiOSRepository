//
//  NewsTableViewCell.swift
//  Top News
//
//  Created by Siba Krushna on 04/08/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }
    private func setUI() {
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = UIColor.black
        authorLabel.font = UIFont.systemFont(ofSize: 14)
        authorLabel.textColor = UIColor.black
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = UIColor.black
    }
    func setData(articleData: Articles) {
        titleLabel.text = articleData.title
        authorLabel.text = articleData.author
        descriptionLabel.text = articleData.descriptionValue
        newsImageView.setImagefromURL(articleData.urlToImage)
    }
}
