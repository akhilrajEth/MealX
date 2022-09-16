//
//  QuickSelectView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/15/22.
//

import SwiftUI

struct QuickSelectView: View {
    var body: some View {
        VStack(spacing: 50) {

            // App title
            Text("MealX")
                .font(.title)
                .fontWeight(.bold)


            // Eat and sell button
            HStack{

                Spacer()

                // Eat button
                NavigationLink(destination: {



                }, label: {

                    // Bring user to eat view
                    Text("Eat")
                        .fontWeight(.semibold)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.green)
                                .frame(width:120, height: 40)
                        )
                        .font(.callout)
                        .foregroundColor(.white)


                }) //: BUTTON

                Spacer()

                // Sell button
                NavigationLink(destination: {



                }, label: {

                    // Bring user to sell view
                    Text("Sell")
                        .fontWeight(.semibold)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.green)
                                .frame(width:120, height: 40)
                        )
                        .font(.callout)
                        .foregroundColor(.white)

                }) //: BUTTON

                Spacer()

            }
        } //: HSTACK

    }
}

struct QuickSelectView_Previews: PreviewProvider {
    static var previews: some View {
        QuickSelectView()
    }
}
