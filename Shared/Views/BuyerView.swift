//
//  BuyerView.swift
//  MealX (iOS)
//
//  Created by Akhil Maheepathi on 8/24/22.
//

import SwiftUI


struct BuyerView: View {
    var body: some View {
        ZStack{
            Button(){
                
            } label: {
                Image("BTheory_Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .buttonBorderShape(.capsule)
            .frame(width: 200, height: 150)
            .tint(.black)
            .offset(y:-275)
            
        }
    }
}

struct BuyerView_Previews: PreviewProvider {
    static var previews: some View {
        BuyerView()
    }
}
