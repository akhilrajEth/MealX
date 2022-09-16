//
//  OrderCellView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/15/22.
//

import SwiftUI

struct OrderCellView: View {
    var body: some View {

        HStack{

            VStack{
                // Order place
                Text("Bonny Castle")
                    .font(.title2)
                    .foregroundColor(.black)

                // Order type
                Text("Bowl")
                    .foregroundColor(.gray)
            } //: VSTACK


        }

    }
}

struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView()
    }
}
