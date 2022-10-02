//
//  EatOrderCompleteView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/17/22.
//

import SwiftUI

struct EatOrderCompleteView: View {

    // MARK: - PROPERTIES
    @Environment (\.presentationMode) var presentationMode
    let title: String
    let message: String

    // MARK: - BODY
    var body: some View {
        VStack{

            HStack{

                VStack(alignment: .leading){

                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .padding(.top, 20)

                    Text(message)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .padding(.top, 0)
                }

                Spacer()
            } //: HSTACK

            Spacer()

            Image("OrderComplete")
                .resizable()
                .scaledToFit()
                .frame(width: 280, height: 220, alignment: .center)
                .padding()

            Spacer()

            // Continue Button
            Button(action: {

                // Return user back to home view

            }, label: {
                Text("Done")
                    .fontWeight(.bold)
                    .modifier(ButtonModifier())
            })
            .padding()

            Spacer()


        } //: VSTACK
        .navigationTitle(title)
    }
}

struct EatOrderCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        EatOrderCompleteView(title: "Test", message: "I am just testing")
    }
}

