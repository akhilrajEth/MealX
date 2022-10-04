//
//  PreviewScreenshotView.swift
//  MealX
//
//  Created by Karthik  Ramu on 10/3/22.
//

import SwiftUI
import Kingfisher

struct PreviewScreenshotView: View {

    // MARK: - PROPERTIES
    let order: Order


    // MARK: - BODY
    var body: some View {
        VStack{

            KFImage(URL(string: order.screenshotURL))
                .resizable()
                .scaledToFit()
                .frame(width: 450, height: 600, alignment: .center)


        } //: VSTACK
        .navigationTitle("Order Screenshot")
    }
}


// MARK: - PREVIEW
//struct PreviewScreenshotView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewScreenshotView()
//    }
//}
