// swiftlint:disable all
import Amplify
import Foundation

extension PushNotification {
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
    let pushNotification = PushNotification.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "PushNotifications"
    
    model.fields(
      .id(),
      .field(pushNotification.body, is: .optional, ofType: .string),
      .field(pushNotification.deviceToken, is: .optional, ofType: .string),
      .field(pushNotification.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(pushNotification.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}