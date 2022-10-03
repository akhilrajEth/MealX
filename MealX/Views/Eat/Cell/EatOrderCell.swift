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

            if order.completed != true {

                NavigationLink(destination: {

                    // Segue to more details


                }, label: {

                    Text("Ordered")
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius:7)
                                .fill(.blue)
                                .frame(width:100, height: 30)
                        )
                    
                }) //: NAV LINK
                .disabled(true)

            } else if order.completed == true {

                NavigationLink(destination: {

                    // Segue to more info

                }, label: {
                    Text("Completed")
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius:7)
                                .fill(.green)
                                .frame(width:100, height: 30)
                        )

                }) //: NAV LINK

            } //: ELSE IF STATEMENT

            Spacer()


        } //: HSTACK

    }
}


// MARK: - PREVIEW
//struct EatOrderCell_Previews: PreviewProvider {
//    static var previews: some View {
//        EatOrderCell()
//    }
//}
