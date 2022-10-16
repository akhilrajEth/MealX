// swiftlint:disable all
import Amplify
import Foundation

public struct Notification: Model {
  public let id: String
  public var body: String?
  public var deviceToken: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      body: String? = nil,
      deviceToken: String? = nil) {
    self.init(id: id,
      body: body,
      deviceToken: deviceToken,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      body: String? = nil,
      deviceToken: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.body = body
      self.deviceToken = deviceToken
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}