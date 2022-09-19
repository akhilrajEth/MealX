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
    
    var body: some View {

        HStack{
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
            NavigationLink {
                SellOrderDetailView(restaurant: restaurant, mealType: mealType, orderDetails: orderDetails)
            } label: {
                Text("Fulfill")
                    .foregroundColor(Color.white)
                    .background(
                        RoundedRectangle(cornerRadius:7)
                            .fill(.green)
                            .frame(width:100, height: 30)
                        )
                    }
            Spacer(minLength: 70)
        }
        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
            .stroke(Color.gray, lineWidth: 1)
            .frame(width:350,height: 90))

    }
}

struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView(restaurant: "Bonny Castle", mealType: "Bowl", orderDetails: "Chicke, brown rice, Vinegar Sauce")
    }
}
