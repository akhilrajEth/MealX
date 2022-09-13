//
//  SellerFulfill.swift
//  MealX
//
//  Created by Akhil Maheepathi on 8/16/22.
//

import SwiftUI

struct SellerFulfill: View {
    var body: some View {
        VStack{
            Text("Summary")
                .font(.largeTitle)
                .bold()
                .offset(x:-120,y:-300)
            Text("Cilantro Lime Rice, Adobo Chicken, Pinto beans, beverage, cheese blend, peppers & onions, corn")
                .font(.title2)
                .offset(y:-270)
            Text("Placeholder for video walkthrough of order/fulfill ment process")
                .offset(y:-200)
            Button(action:{}){
                HStack{
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("Upload Confirmation and receive payment ")
                        .font(.title)
                }
            }
            .offset(y: 200)
                    }
    }
}

struct SellerFulfill_Previews: PreviewProvider {
    static var previews: some View {
        SellerFulfill()
    }
}
