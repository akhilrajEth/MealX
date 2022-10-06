//
//  SwiftUIView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/15/22.
//

import SwiftUI

struct SignUpViewTwo: View {

    // MARK: - PROPERTIES
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var payPalLink = ""
    @State private var password = ""

    // Instance variables
    let name: String
    let email: String

    // MARK: - BODY
    var body: some View {

        VStack{

            //NavigationLink(destination: SelectProfileImageView(), isActive: $viewModel.didAuthenticateUser, label: {})

            // Progress View
            VStack{
                // Progress capsule
                ProgressView(value: 1)
                    .padding()
                    .frame(width: 150, height: 15, alignment: .center)
                    .accentColor(Color.green)

                Text("Step 2/2")
                    .font(.footnote)

            }
            .padding()

            // Text fields for user inputs
            CustomInputField(fieldTitle: "Password", placeholder: "", isSecureField: true, text: $password)

            CustomInputField(fieldTitle: "PayPal Link", placeholder: "", isSecureField: false, text: $payPalLink)

            Spacer()

            // Done Button
            Button(action: {

                // Create user in Firebase
                viewModel.register(name: name, withEmail: email, password: password, payPalLink: payPalLink)

            }, label: {
                Text("Done")
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
struct SignUpViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        SignUpViewOne()
            .environmentObject(AuthViewModel())
    }
}
