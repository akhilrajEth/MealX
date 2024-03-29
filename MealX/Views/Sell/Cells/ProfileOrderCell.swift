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
            HStack{

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
                        Text("Completed")
                            .foregroundColor(Color.white)
                            .frame(width: 100, height:30)
                            .background(
                                RoundedRectangle(cornerRadius:7)
                                    .fill(.blue)
                                    .frame(width:100, height: 30)
                            )

                })
                .padding()

            }
            .onAppear(){
                self.viewModel.updateStatus(orderID: order.id, status: false)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.gray, lineWidth: 0.5)
            )

            Spacer() 

        }

    }
}

// MARK: - PREVIEW
//struct ProfileOrderCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileOrderCell()
//    }
//}
