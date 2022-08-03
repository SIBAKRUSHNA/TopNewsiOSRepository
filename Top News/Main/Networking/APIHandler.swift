//
//  APIHandler.swift
//  Top News
//
//  Created by Mobiotics on 03/08/22.
//

import UIKit

class APIHandler: NSObject {
    fileprivate func returnParameter() -> [String:Any] {
        var parameter = [String:Any]()
        parameter["apiKey"] = "ee45cdc492ec41e08eb6c9bb62f8d037"
        parameter["sources"] = "techcrunch"
        return parameter
    }
    static let shared = APIHandler()
    public func callNewsAPI(success: @escaping ((NewsResponse) -> Void)) {
        APIManager.shared.callAPI(endPoint: APIEndPoints.newsList) { response, error in
            if let response = response {
                success(NewsResponse(object: response))
            } else {
                guard let error = error else {
                    print("Unknow error")
                    return
                }
                print("Response Error \(error.localizedDescription)")
            }
        }
    }
}
