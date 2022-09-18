//
//  OrderDetailView.swift
//  MealX
//
//  Created by Akhil Maheepathi on 9/17/22.
//

import SwiftUI

struct OrderDetailView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    Text("Enter the meal below on GrubHub using your meal exchange.")
                        .padding(.leading)
                    Spacer(minLength: 40)
                    VStack(alignment: .leading){
                        // Order place
                        Text("Bonny Castle")
                            .font(Font.system(size: 25).bold())
                            .foregroundColor(.black)
                            .padding(.leading)

                        // Order type
                        Text("Bowl")
                            .font(Font.system(size:20))
                            .foregroundColor(.gray)
                            .padding(.leading)
                    } //: VSTACK
                    Spacer(minLength: 20)
                    VStack(spacing: 10){
                        ForEach(0..<5){ _ in
                            Text(" - Item")
                        }
                    }
                    Spacer(minLength: 40)
                    HStack{
                        Spacer()
                        NavigationLink(destination: {
                            
                        }, label: {
                            Text("Continue")
                                .modifier(ButtonModifier())
                        })
                        Spacer()
                    }
                }
            }
            .navigationTitle("Order Details")
        }
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView()
    }
}
