//
//  LogInVIew.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/14/22.
//

import SwiftUI

struct LogInView: View {

    // MARK: - PROPERTIES
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""

    // MARK: - BODY
    var body: some View {

        VStack{
            // Text fields for user inputs
            CustomInputField(fieldTitle: "Email", isSecureField: false, text: $email)

            CustomInputField(fieldTitle: "Password", isSecureField: true, text: $password)

            Spacer()

            // Done button
            Button(action: {
                // Verify info
                viewModel.logIn(withEmail: email, password: password)

            }, label: {
                Text("Done")
                    .fontWeight(.bold)
                    .modifier(ButtonModifier())
            })

            Spacer()

        } //: VSTACK
        .navigationTitle("Log In")
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - PREVIEW
struct LogInVIew_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
            .environmentObject(AuthViewModel())
    }
}
