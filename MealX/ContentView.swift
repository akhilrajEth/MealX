//
//  ContentView.swift
//  TestingBackend
//
//  Created by Akhil Maheepathi on 10/15/22.
//

import SwiftUI
import AWSDataStorePlugin
import Amplify

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter a message", text: $viewModel.messageText)
            
            Button("Send", action: viewModel.sendMessage)
        }
        .padding()
    }
}

extension ContentView {
    class ViewModel: ObservableObject{
        @Published var messageText = ""
        
        func sendMessage() {
            guard let deviceToken = DeviceTokenManager.shared.deviceToken else {return}
          
            print(deviceToken)
            do {
                let item = PushNotification(body: messageText, deviceToken: deviceToken)
                
                let savedItem = try Amplify.DataStore.save(item)
            }
            catch let error as DataStoreError{
                print("\(error)")
            }
            catch{
                print("Damn")
            }
            
            
            print(messageText)
            messageText.removeAll()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
