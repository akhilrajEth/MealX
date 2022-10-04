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

                    HStack{
                        Text("Select an Order to fulfill and sell your meal exchange.")
                            .padding()
                        Spacer()
                    } //: HSTACK

                    ScrollView{
                        Spacer(minLength: 20)
                        VStack(spacing:10){
                            ForEach(viewModel.orders){
                                order in
                                    OrderCell(restaurant: order.restaurant, mealType: order.mealType,orderDetails: order.orderDetails,order:order)
                            }
                            .padding()
                        }
                    }
                    .onAppear(){
                        self.viewModel.getOrderData()

                    }
                } //: VSTACK
            .navigationTitle("Orders")

           
            
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
