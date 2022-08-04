//
//  UIImageView+Extension.swift
//  Top News
//
//  Created by Siba Krushna on 04/08/22.
//

import UIKit
import SDWebImage

extension UIImageView {
    public func setImagefromURL(_ urlString:String?){
        self.contentMode = .scaleAspectFill
        guard let urlString = urlString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string:urlString) else {
            return
        }
        let sdWebImageOptions:SDWebImageOptions = [.retryFailed,.scaleDownLargeImages]
        self.sd_setImage(with: url, placeholderImage: nil, options: sdWebImageOptions) { (_, error, cacheType, _) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
