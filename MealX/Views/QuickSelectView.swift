//
//  QuickSelectView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/15/22.
//

import SwiftUI

struct QuickSelectView: View {

    // MARK: - PROPERTIES
    @State private var eatView = false
    @State private var sellView = false

    // MARK: - BODY
    var body: some View {

        Group {

            if eatView == true {
                EatView()
            }

            else if sellView == true {

                SellView()
            }

            else {
                mainQuickSelectView
            }
        }


    }
}



extension QuickSelectView {

    var mainQuickSelectView: some View {

        NavigationView{

            VStack{

                Spacer()

                VStack(spacing: 50){

                    // App title
                    Text("MealX")
                        .font(.title)
                        .fontWeight(.bold)


                    // Eat and sell button
                    HStack{

                        Spacer()

                        // Eat button
                        Button(action: {

                            eatView.toggle()

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
<<<<<<< HEAD
                        Button(action: {

                            sellView.toggle()
=======
                        NavigationLink(destination: {
                            SellHomeView()
>>>>>>> ba65a04acabc2585800594c809f8973ddbc8d944

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

                    } //: HSTACK

                }


                Spacer()


            } //: VSTACK

        } //: NAV VIEW
    }
}

struct QuickSelectView_Previews: PreviewProvider {
    static var previews: some View {
        QuickSelectView()
    }
}
