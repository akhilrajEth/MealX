//
//  OrderCellView.swift
//  MealX
//
//  Created by Akhil  Maheepathi on 9/17/22.
//

import SwiftUI

struct OrderCellView: View {
    var body: some View {

        HStack{
            Spacer()
            VStack(alignment:.leading){
                // Order place
                Text("Bonny Castle")
                    .font(Font.title2.bold())
                    .foregroundColor(.black)

                // Order type
                Text("Bowl")
                    .foregroundColor(.gray)
            } //: VSTACK
            Spacer(minLength: 100)
            NavigationLink {
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
        OrderCellView()
    }
}
