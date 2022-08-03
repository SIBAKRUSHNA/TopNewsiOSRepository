//
//  APIEndPoints.swift
//  Top News
//
//  Created by Mobiotics on 03/08/22.
//

import UIKit
/**
 Here we can get used api end point and its HTTP method. Tuples
 */
struct APIEndPoints {
    ///newsList
    static let newsList: (String, APIMethod) = ("v2/" + "top-headlines",.GET)
}
