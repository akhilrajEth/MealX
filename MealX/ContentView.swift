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
            
            print(messageText)
            messageText.removeAll()
            
            let message = Notification(body: messageText, deviceToken: deviceToken)
            
            Amplify.DataStore.save(message) {result in
                switch result {
                case .success(let savedMesssage):
                    print("Sent", savedMesssage)
                    DispatchQueue.main.async{ [weak self] in
                        self?.messageText.removeAll()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
