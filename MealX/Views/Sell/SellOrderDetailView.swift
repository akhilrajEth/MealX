//
//  OrderDetailView.swift
//  MealX
//
//  Created by Akhil Maheepathi on 9/17/22.
//

import SwiftUI

struct SellOrderDetailView: View {
    let restaurant:String
    let mealType:String
    let orderDetails:String
    var order:Order
    
    @ObservedObject private var viewModel = SellViewModel()

    
    var body: some View {
        VStack{

            HStack{
                Text("Enter the following order in GrubHub")
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

                    Text("\(restaurant)")
                        .font(.title2)

                    Text("\(mealType)")
                        .font(.title3)
                        .foregroundColor(.gray)

                } //: VSTACK
                .padding()
                

                Spacer()
            } //: HSTACK

            HStack{

                Text(orderDetails)
                    .multilineTextAlignment(.leading)
                    .padding()

                Spacer()
            }
            Spacer()
            // Continue Button
            NavigationLink(destination: {

                // Need to add paypal link as a button

                // Segues user to order confirmation view
                SellAddScreenshotView()

            }, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .modifier(ButtonModifier())
            })
            .padding()

            Spacer(minLength: 100)


        } //: VSTACK
        .navigationTitle("Order Details")
        .onAppear(){
            self.viewModel.updateStatus(uid: order.id, status:true)
        }


    }
}
/*

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SellOrderDetailView(restaurant: "Bonny Castle", mealType: "Bowl", orderDetails: "Chicke, brown rice, vinegar sauce")
    }
}
*/
