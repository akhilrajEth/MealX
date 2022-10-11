//
//  SellHomeView.swift
//  MealX
//
//  Created by Akhil  Maheepathi on 9/17/22.
//

import SwiftUI

struct SellHomeView: View {

    // MARK: - PROPERTIES
    @ObservedObject private var viewModel = SellViewModel()
    @State var isActive : Bool = false


    // MARK: - BODY
    var body: some View {

        NavigationView{
                VStack(alignment: .leading){

                    HStack{
                        Text("Select an Order to fulfill and sell your meal exchange.")
                            .padding()
                        Spacer()
                    } //: HSTACK

                    if viewModel.orders.count != 0 {

                        ScrollView{
                            Spacer(minLength: 20)
                            VStack(spacing:10){
                                ForEach(viewModel.orders){
                                    order in
                                    if(order.completed != true && order.orderFrom != AuthViewModel().userSession!.uid){
                                        OrderCell(rootIsActive: $isActive, restaurant: order.restaurant, mealType: order.mealType,orderDetails: order.orderDetails,order:order)
                                    }

                                }
                                .onTapGesture(perform: {
                                    self.isActive = true
                                })
                                .padding()
                            }
                        }

                    } else {

                        Spacer(minLength: 20)
                        HStack{
                            Spacer()
                            Text("No orders have been placed yet. Tell your friends to order on the app!")
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding()
                            Spacer()
                        } //: HSTACK 

                        Spacer()
                    }


                } //: VSTACK
                .navigationTitle("Orders")
                .onAppear(){
                    self.viewModel.getOrderData()
                }
           
            
        } //: NAV VIEW
        .navigationViewStyle(.stack)
    }
}


// MARK: - PREVIEW
struct SellHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SellHomeView()
    }
}
