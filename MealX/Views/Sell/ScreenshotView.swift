//
//  ScreenshotView.swift
//  MealX
//
//  Created by Akhil Maheepathi on 9/17/22.
//

import SwiftUI

struct ScreenshotView: View {
    var body: some View {
        Text("ScreenShot!")
        Spacer()
        NavigationLink(destination: {
            CompleteView()
        }, label:{
            Text("Pay Seller")
                .fontWeight(.bold)
                .modifier(ButtonModifier())
        })
        Spacer()
        
    }
}

struct ScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotView()
    }
}
