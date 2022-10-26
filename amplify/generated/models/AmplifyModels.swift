// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "d79045496c98467c3d17115bd886da78"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: PushNotification.self)
  }
}