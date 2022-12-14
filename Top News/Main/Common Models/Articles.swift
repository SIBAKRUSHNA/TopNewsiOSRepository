//
//  Articles.swift
//
//  Created by Siba Krushna on 03/08/22
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Articles: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let content = "content"
    static let source = "source"
    static let urlToImage = "urlToImage"
    static let publishedAt = "publishedAt"
    static let title = "title"
    static let descriptionValue = "description"
    static let author = "author"
    static let url = "url"
  }

  // MARK: Properties
  public var content: String?
  public var source: Source?
  public var urlToImage: String?
  public var publishedAt: String?
  public var title: String?
  public var descriptionValue: String?
  public var author: String?
  public var url: String?

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
    content = json[SerializationKeys.content].string
    source = Source(json: json[SerializationKeys.source])
    urlToImage = json[SerializationKeys.urlToImage].string
    publishedAt = json[SerializationKeys.publishedAt].string
    title = json[SerializationKeys.title].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    author = json[SerializationKeys.author].string
    url = json[SerializationKeys.url].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = content { dictionary[SerializationKeys.content] = value }
    if let value = source { dictionary[SerializationKeys.source] = value.dictionaryRepresentation() }
    if let value = urlToImage { dictionary[SerializationKeys.urlToImage] = value }
    if let value = publishedAt { dictionary[SerializationKeys.publishedAt] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = author { dictionary[SerializationKeys.author] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.content = aDecoder.decodeObject(forKey: SerializationKeys.content) as? String
    self.source = aDecoder.decodeObject(forKey: SerializationKeys.source) as? Source
    self.urlToImage = aDecoder.decodeObject(forKey: SerializationKeys.urlToImage) as? String
    self.publishedAt = aDecoder.decodeObject(forKey: SerializationKeys.publishedAt) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.author = aDecoder.decodeObject(forKey: SerializationKeys.author) as? String
    self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(content, forKey: SerializationKeys.content)
    aCoder.encode(source, forKey: SerializationKeys.source)
    aCoder.encode(urlToImage, forKey: SerializationKeys.urlToImage)
    aCoder.encode(publishedAt, forKey: SerializationKeys.publishedAt)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(author, forKey: SerializationKeys.author)
    aCoder.encode(url, forKey: SerializationKeys.url)
  }

}
