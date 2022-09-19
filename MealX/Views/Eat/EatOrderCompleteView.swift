//
//  EatOrderCompleteView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/17/22.
//

import SwiftUI

struct EatOrderCompleteView: View {

    // MARK: - PROPERTIES
    let title: String
    let message: String

    // MARK: - BODY
    var body: some View {
        VStack{

            HStack{
                Text(message)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .padding(.top, 0)
                    .padding(.bottom, 0)

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

