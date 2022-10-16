// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "bccaf329c77357daeaeebcdde7d0d978"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Notification.self)
  }
}