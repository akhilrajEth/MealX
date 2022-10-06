//
//  WelcomeView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/14/22.
//

import SwiftUI

struct WelcomeView: View {

    // MARK: - PROPERTEIS
    @EnvironmentObject var viewModel: AuthViewModel

    @EnvironmentObject var appState: AppState

    // MARK: - BODY
    var body: some View {

        Group {

            // If no user is signed in, bring them to the main welcome view
            if viewModel.userSession == nil {
                mainWelcomeView
            } else {
                QuickSelectView()
                    .id(appState.rootViewId)
            }
        } //: GROUP

    }
}

extension WelcomeView {

    var mainWelcomeView: some View {
        NavigationView {
            VStack(alignment: .center) {

                VStack(spacing: 30){

                    // NOTE: Need to add updated asset (high res) here
                    Image("Circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
                        .padding(.bottom, 0)
                    
                    
                    Image("MealXImage")
                        .resizable()
                        .scaledToFit()
                        .offset(y:-100)
                        .frame(width: 200,height: 100)
                    
                    Text("Let's get you started")
                        .font(.title)
                        .bold()
                        .offset(y:-50)

                    Spacer()
                }


                Spacer()

                VStack(spacing: 60) {
                    
                    NavigationLink {
                        SignUpViewOne()
                    }
                    label: {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .modifier(ButtonModifier())
                            //.frame(width: 320)
                    }


                    NavigationLink {
                        LogInView()
                    } label: {
                        Text("Log In")
                            .fontWeight(.bold)
                            .modifier(ButtonModifier())
                            //.frame(width:320)
                    }
    
                    
                } //: VSTACK

                Spacer(minLength: 225)

            } //: VSTACK
        } //: NAVVIEW

    }

}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(AuthViewModel())
    }
}
