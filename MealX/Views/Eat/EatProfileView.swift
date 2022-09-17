//
//  EatProfileView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/17/22.
//

import SwiftUI

struct EatProfileView: View {

    // MARK: - PROPERTIES
    @EnvironmentObject var viewModel: AuthViewModel


    // MARK: - BODY
    var body: some View {

        VStack{

            Button(action: {
                viewModel.signOut()

            }, label: {

                // Sign out button
                Text("Sign Out")
                    .fontWeight(.bold)
                    .modifier(ButtonModifier())
            })

        } //: VSTACK
    }
}


// MARK: - PREVIEW
struct EatProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EatProfileView()
            .environmentObject(AuthViewModel())
    }
}
