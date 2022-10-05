//
//  ProfileOrderCell.swift
//  MealX
//
//  Created by Karthik  Ramu on 10/4/22.
//

import SwiftUI

struct ProfileOrderCell: View {

    // MARK: - PROPERTIES
    @ObservedObject private var viewModel = SellViewModel()
    let restaurant:String
    let mealType:String
    let orderDetails:String
    var order:Order


    // MARK: - BODY
    var body: some View {
        HStack{
            Spacer()
            VStack(alignment:.leading){
                // Order place
                Text("\(restaurant)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)

                // Order type
                Text("\(mealType)")
                    .foregroundColor(.gray)
            } //: VSTACK
            .padding()

            Spacer()

            NavigationLink(destination: {EmptyView()}, label: {
                if(order.pending == false){
                    Text("Fulfill")
                        .foregroundColor(Color.white)
                        .frame(width: 100, height:30)
                        .background(
                            RoundedRectangle(cornerRadius:7)
                                .fill(.green)
                                .frame(width:100, height: 30)
                        )

                }
                else if (order.pending == true){
                    Text("In Progress")
                        .foregroundColor(Color.white)
                        .frame(width: 100,height:30)
                        .background(
                            RoundedRectangle(cornerRadius:7)
                                .fill(.orange)
                                .frame(width:100, height: 30)
                        )
                }
            })
            .disabled(order.pending != false)


            Spacer(minLength: 50)

        }
        .onAppear(){
            self.viewModel.updateStatus(orderID: order.id, status: false)
        }
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
            .stroke(Color.gray, lineWidth: 0.5)
            .frame(width: 350,height: 90)
        )
    }
}

// MARK: - PREVIEW
//struct ProfileOrderCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileOrderCell()
//    }
//}
