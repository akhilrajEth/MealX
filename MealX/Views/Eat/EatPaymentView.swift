//
//  EatPaymentView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/17/22.
//

import SwiftUI

struct EatPaymentView: View {

    // MARK: - PROPERTIES
    let mealDetails: String
    let restaurant: String
    let foodType: String
    @State var paymentComplete = false
    @ObservedObject var viewModel = EatViewModel()


    // MARK: - BODY
    var body: some View {

        VStack{

            HStack{
                Text("Pay the seller with the PayPal link below. ")
                    .multilineTextAlignment(.leading)
                    .padding()
                    .padding(.top, 0)
                    .padding(.bottom, 0)

                Spacer()

            } //: HSTACK

            // Price
            HStack{
                Text("$5.29")
                    .font(.title)
                    .bold()
                    .padding()

                Spacer()
            } //: HSTACK



            // Restaurant and meal type
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

            HStack{

                Text(mealDetails)
                    .multilineTextAlignment(.leading)
                    .padding()

                Spacer()
            }

            NavigationLink(destination: {

                EatOrderCompleteView(title: "Complete!", message: "You’re all done! You should see this completed order in your profile page.")

            }, label: {

                // Continue Button
                Button(action: {

                    // Need to add paypal link as a button

                    // Upload data to Firebase
                    viewModel.setOrderData(restaurant: restaurant, mealType: foodType, orderDetails: mealDetails, payment: paymentComplete)

                }, label: {
                    Text("Pay Seller")
                        .fontWeight(.bold)
                        .modifier(ButtonModifier())
                })
                .padding()

            })


            Spacer(minLength: 100)


        } //: VSTACK
        .navigationTitle("Order Details")


    }
}


// MARK: - PREVIEW
struct EatPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        EatPaymentView(mealDetails: "Lettuce, Cheese, Onions", restaurant: "Bonny", foodType: "Sandwich")
    }
}
