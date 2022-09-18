//
//  EatOrderCompleteView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/17/22.
//

import SwiftUI

struct CompleteView: View {

    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        VStack{

            HStack{
                Text("You’re all done! You should see this completed order in your profile page. ")
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
        .navigationTitle("Complete!")
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}
