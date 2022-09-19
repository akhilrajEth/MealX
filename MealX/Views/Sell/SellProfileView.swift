//
//  SellProfileView.swift
//  MealX
//
//  Created by Akhil Maheepathi on 9/17/22.
//

import SwiftUI

struct SellProfileView: View {

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
struct SellProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SellProfileView().environmentObject(AuthViewModel())
    }
}
