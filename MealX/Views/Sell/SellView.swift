//
//  SellView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/18/22.
//

import SwiftUI

struct SellView: View {

    // MARK: - PROPERTIES
    @State private var selection = 2


    // MARK: - BODY
    var body: some View {

        TabView(selection: $selection){

            SellProfileView().tabItem({
                Image(systemName: "person")
                Text("Profile")
            })
            .tag(1)

            SellHomeView().tabItem({
                Image(systemName: "cart")
                Text("Order")
            })
            .tag(2)

        } //: TAB VIEW
    }
}

struct SellView_Previews: PreviewProvider {
    static var previews: some View {
        SellView()
    }
}
