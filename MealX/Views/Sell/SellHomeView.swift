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
    // MARK: - BODY
    var body: some View {

        NavigationView{
                VStack(alignment: .leading){
                    Text("Select an Order to fulfill and sell your meal exchange.")
                        .padding(.leading)
                   
                    ScrollView{
                        Spacer(minLength: 40)
                        VStack(spacing:60){
                            ForEach(viewModel.orders){
                                order in
                                    VStack(alignment: .leading){
                                        OrderCellView(restaurant: order.restaurant, mealType: order.mealType,orderDetails: order.orderDetails,order:order)
                                    }

                            }
                        }
                    }
                    .onAppear(){
                        self.viewModel.getOrderData()
                        //print(order.pending)
                    }
                } //: VSTACK
            .navigationTitle("Orders")
           
            
        } //: NAV VIEW
    }
}

struct SellHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SellHomeView()
    }
}
