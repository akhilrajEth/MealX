//
//  EatOrderDetailsView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/17/22.
//

import SwiftUI

struct EatOrderDetailsView: View {

    // MARK: - PROPERTIES
    @State private var detailText = ""
    let description = """
    Type something like this:

        - No Lettuce
        - Cheese
        - Onions
        - Jalepeneos
    """

    let restaurant: String
    let foodType: String


    // MARK: - BODY
    var body: some View {
        VStack{

            HStack{
                Text("Enter your meal instructions below")
                    .multilineTextAlignment(.leading)
                    .padding()
                    .padding(.top, 0)
                    .padding(.bottom, 0)

                Spacer()

            } //: HSTACK

            HStack {
                VStack(alignment: .leading){

                    Text("Bonny Castle")
                        .font(.title2)

                    Text("Sandwich")
                        .font(.title3)
                        .foregroundColor(.gray)

                } //: VSTACK
                .padding()

                Spacer()
            } //: HSTACK


            TextEditor(text: self.$detailText)
             .foregroundColor(self.detailText == description ? .gray : .black)
             .padding()
             .multilineTextAlignment(.leading)
             .onTapGesture {
                 if self.detailText == description{
                     self.detailText = ""
                 }
             }

            // Continue Button
            NavigationLink(destination: {

                // Segue to payment view
                EatPaymentView(mealDetails: detailText, restaurant: restaurant, foodType: foodType)

            }, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .modifier(ButtonModifier())
            })
            .padding()


            Spacer(minLength: 125)


        } //: VSTACK
        .navigationTitle("Order Details")
        .onAppear{
            self.detailText = description
        }
    }
}

// MARK: - PREVIEW
struct EatOrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EatOrderDetailsView(restaurant: "Bonny Castle", foodType: "Sandwich")
    }
}
