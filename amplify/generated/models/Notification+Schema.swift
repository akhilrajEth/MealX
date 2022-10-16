// swiftlint:disable all
import Amplify
import Foundation

extension Notification {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case body
    case deviceToken
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let notification = Notification.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "Notifications"
    
    model.fields(
      .id(),
      .field(notification.body, is: .optional, ofType: .string),
      .field(notification.deviceToken, is: .optional, ofType: .string),
      .field(notification.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(notification.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}