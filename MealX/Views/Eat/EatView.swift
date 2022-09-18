//
//  EatView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/17/22.
//

import SwiftUI

struct EatView: View {

    // MARK: - PROPERTIES
    @State private var selection = 2



    // MARK: - BODY
    var body: some View {

        TabView(selection: $selection){

            EatProfileView().tabItem({
                Image(systemName: "person")
                Text("Profile")
            })
            .tag(1)

            EatOrderView().tabItem({
                Image(systemName: "cart")
                Text("Order")
            })
            .tag(2)

        }
    }
}

struct EatView_Previews: PreviewProvider {
    static var previews: some View {
        EatView()
    }
}
