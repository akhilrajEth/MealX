//
//  MealXApp.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/14/22.
//

import SwiftUI
import Firebase
import Amplify
import AWSAPIPlugin
import AWSDataStorePlugin



class DeviceTokenManager {
    private init() {}
    static let shared = DeviceTokenManager()
    
    var deviceToken :String?
    
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data){
        let token = deviceToken
            .map{ String(format: "%02.2hhx", $0)}
            .joined()
        
        DeviceTokenManager.shared.deviceToken = token
    }
}

@main
struct MealXApp: App {

    /*
    init(){
        FirebaseApp.configure()
    }*/
    
    init(){
        configureAmplify()
    }

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var viewModel = AuthViewModel()
    @ObservedObject var appState = AppState()
    @State var notificationService = NotificationService()



    var body: some Scene {
                
        
        WindowGroup {
            /*WelcomeView()
                .environmentObject(viewModel)
                .environmentObject(appState)*/
            ContentView()
                .onAppear(perform: notificationService.requestPermission)

                
        }
        
    }
    
    func configureAmplify(){
        do{
            let models = AmplifyModels()
            try Amplify.add(plugin: AWSDataStorePlugin(modelRegistration: models))
            try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: models))
            
            try Amplify.configure()
            
            print("Configured Amplify")
        } catch {
            
        }
    }
}
