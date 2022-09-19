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
                    /*
                    List(viewModel.orders){ order in
                        VStack(alignment: .leading, spacing: 60){
                            OrderCellView(restaurant: order.restaurant, mealType: order.mealType)
                        }
                    }
                    .onAppear(){
                        self.viewModel.getOrderData()
                    }
                     */
                    ScrollView{
                        Spacer(minLength: 40)
                        VStack(spacing:60){
                            ForEach(viewModel.orders){
                                order in
                                VStack(alignment: .leading){
                                    OrderCellView(restaurant: order.restaurant, mealType: order.mealType,orderDetails: order.orderDetails)
                                }
                                
                            }
                        }
                    }
                    .onAppear(){
                        self.viewModel.getOrderData()
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
