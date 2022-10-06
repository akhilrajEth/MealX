//
//  SignUpView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/14/22.
//

import SwiftUI

struct SignUpViewOne: View {

    // MARK: - PROPERTIES
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var name = ""
    @State private var email = ""


    // MARK: - BODY
    var body: some View {

        VStack{

            // Progress view
            VStack{
                // Progress capsule
                ProgressView(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                    .padding()
                    .frame(width: 150, height: 15, alignment: .center)
                    .accentColor(Color.green)

                Text("Step 1/2")
                    .font(.footnote)
            }
            .padding()


            // Text fields for user inputs
            CustomInputField(fieldTitle: "What's your name?", placeholder: "", isSecureField: false, text: $name)

            CustomInputField(fieldTitle: "What's your university email?", placeholder: "", isSecureField: false, text: $email)

            Spacer()

            // Continue Button
            NavigationLink(destination: {
                // Segue to sign up two screen
                SignUpViewTwo(name: name, email: email)

            }, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .modifier(ButtonModifier())
            }) //: BUTTON

            Spacer()

        } //: VSTACK
        .navigationTitle("Sign Up")
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - PREVIEW
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpViewOne()
            .environmentObject(AuthViewModel())
    }
}
