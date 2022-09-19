//
//  SellHomeView.swift
//  MealX
//
//  Created by Akhil  Maheepathi on 9/17/22.
//

import SwiftUI

struct SellHomeView: View {

    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {

        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    Text("Select an Order to fulfill and sell your meal exchange.")
                        .padding(.leading)
                    
                    Spacer(minLength: 75)

                    VStack(spacing: 60){
                        ForEach(0..<3){ _ in
                            OrderCellView()
                        }

                    } //: VSTACK
                } //: VSTACK

            } //: SCROLL VIEW
            .navigationTitle("Orders")
            
        } //: NAV VIEW
    }
}

struct SellHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SellHomeView()
    }
}
