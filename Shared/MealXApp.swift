//
//  MealXApp.swift
//  Shared
//
//  Created by Akhil Maheepathi on 8/15/22.
//

import SwiftUI

import FirebaseCore
import FirebaseFirestore



class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


class AppState: ObservableObject{
    @Published var eater: Bool?
    @Published var seller: Bool?
    @Published var listOrders: Bool?
    
    init(eater: Bool, seller: Bool, listOrders: Bool){
        self.eater = eater
        self.seller = seller
        self.listOrders = listOrders
        
    }
}


@main
struct MealXApp: App {
    @ObservedObject var appState = AppState(eater: false, seller: false, listOrders: false)
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup{
            if appState.seller!{
                SellerView()
                    .environmentObject(appState)
                
            }
            else if appState.listOrders!{
                ListOrders()
                    .environmentObject(appState)
            }
            
            else{
                IntentView()
                    .environmentObject(appState)
            }
         
        }
    }
}
