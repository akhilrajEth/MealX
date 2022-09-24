//
//  OrderCellView.swift
//  MealX
//
//  Created by Akhil  Maheepathi on 9/17/22.
//

import SwiftUI

struct OrderCellView: View {
    let restaurant:String
    let mealType:String
    let orderDetails:String
    var order:Order
    
        
    @ObservedObject private var viewModel = SellViewModel()
    
    
    //status 0:ready, 1:pending, 2:fufilled
    var body: some View {
        HStack{
            ForEach(viewModel.orders){
                order in
                if(order.id == order.id){
                  
                }
            }
            
            Spacer()
            VStack(alignment:.leading){
                // Order place
                Text("\(restaurant)")
                    .font(Font.title2.bold())
                    .foregroundColor(.black)

                // Order type
                Text("\(mealType)")
                    .foregroundColor(.gray)
            } //: VSTACK
            Spacer(minLength: 100)
            
            if order.pending != true {
                
                NavigationLink(destination: {
                    SellOrderDetailView(restaurant: restaurant, mealType: mealType, orderDetails: orderDetails, order:order)},
                               
                    label:{
                    
                        Text("Fulfill")
                            .foregroundColor(Color.white)
                            .background(
                                RoundedRectangle(cornerRadius:7)
                                    .fill(.green)
                                    .frame(width:100, height: 30)
                                )
                    
                })
                
                
            } else {
                
                NavigationLink(destination: {
                    SellOrderDetailView(restaurant: restaurant, mealType: mealType, orderDetails: orderDetails, order:order)},
                               
                    label:{
                    
                        Text("In Progress")
                            .foregroundColor(Color.white)
                            .background(
                                RoundedRectangle(cornerRadius:7)
                                    .fill(.red)
                                    .frame(width:100, height: 30)
                                )
                    
                })
                .disabled(order.pending)

            }
            
            
                    
               /* else{
                    Text("In Progress")
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius:7)
                                .fill(.red)
                                .frame(width:100, height: 30)
                        )
                    
                }*/
 
                    
            Spacer(minLength: 70)
        }
        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
            .stroke(Color.gray, lineWidth: 1)
            .frame(width:350,height: 90))

    }

}
/*
struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView(restaurant: "Bonny Castle", mealType: "Bowl", orderDetails: "Chicke, brown rice, Vinegar Sauce", status: $placeValue)
    }
}
*/
