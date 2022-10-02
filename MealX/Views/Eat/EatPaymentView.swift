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
    @State var showCompleteView = false
    @State var orderComplete = false
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

            Button(action: {

                // Add PayPal link to button

                // Set order data
                viewModel.setOrderData(restaurant: restaurant, mealType: foodType, orderDetails: mealDetails, completed: orderComplete)

                // Toggle the show complete var
                showCompleteView.toggle()

            }, label: {

                Text("Pay")
                    .fontWeight(.bold)
                    .modifier(ButtonModifier())

            })
            .sheet(isPresented: $showCompleteView, content: {
                EatOrderCompleteView(title: "Success!", message: "You’re all done! You can view the order status in your profile page.")
            })
            .padding()


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
