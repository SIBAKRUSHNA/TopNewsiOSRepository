//
//  NewsResponse.swift
//
//  Created by Siba Krushna on 03/08/22
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class NewsResponse: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let articles = "articles"
    static let totalResults = "totalResults"
  }

  // MARK: Properties
  public var status: String?
  public var articles: [Articles]?
  public var totalResults: Int?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    status = json[SerializationKeys.status].string
    if let items = json[SerializationKeys.articles].array { articles = items.map { Articles(json: $0) } }
    totalResults = json[SerializationKeys.totalResults].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = articles { dictionary[SerializationKeys.articles] = value.map { $0.dictionaryRepresentation() } }
    if let value = totalResults { dictionary[SerializationKeys.totalResults] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
    self.articles = aDecoder.decodeObject(forKey: SerializationKeys.articles) as? [Articles]
    self.totalResults = aDecoder.decodeObject(forKey: SerializationKeys.totalResults) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(articles, forKey: SerializationKeys.articles)
    aCoder.encode(totalResults, forKey: SerializationKeys.totalResults)
  }

}
