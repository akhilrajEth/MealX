//
//  EatOrderCell.swift
//  MealX
//
//  Created by Karthik  Ramu on 10/1/22.
//

import SwiftUI

struct EatOrderCell: View {

    // MARK: - PROPERTIES
    var order: Order

    // MARK: - BODY
    var body: some View {

        HStack{

            Spacer()

            HStack{

                VStack(alignment:.leading){
                    // Order place
                    Text("\(order.restaurant)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                    // Order type
                    Text("\(order.mealType)")
                        .foregroundColor(.gray)
                } //: VSTACK
                .padding()

                Spacer()

                NavigationLink(destination: {

                    if order.completed == true {
                        // Segue to more info
                        PreviewScreenshotView(order: order)
                    }

                }, label: {

                    if order.completed == true {
                        Text("Completed")
                            .foregroundColor(Color.white)
                            .background(
                                RoundedRectangle(cornerRadius:7)
                                    .fill(.green)
                                    .frame(width:100, height: 30)
                            )
                            .padding()
                    } else {

                        Text("Ordered")
                            .foregroundColor(Color.white)
                            .background(
                                RoundedRectangle(cornerRadius:7)
                                    .fill(.blue)
                                    .frame(width:100, height: 30)
                            )
                            .padding()
                    }
                }) //: NAV LINK
                .disabled(order.pending != false)


            } //: HSTACK
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.gray, lineWidth: 0.5)
            )

            Spacer()
        }


    }
}


// MARK: - PREVIEW
//struct EatOrderCell_Previews: PreviewProvider {
//    static var previews: some View {
//        EatOrderCell()
//    }
//}
