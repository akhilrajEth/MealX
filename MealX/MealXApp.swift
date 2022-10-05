//
//  MealXApp.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/14/22.
//

import SwiftUI
import Firebase

@main
struct MealXApp: App {

    init(){
        FirebaseApp.configure()
    }

    @StateObject var viewModel = AuthViewModel()
    @ObservedObject var appState = AppState()


    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(viewModel)
                .environmentObject(appState)

                
        }
        
    }
}
