//
//  EatOrderDetailsView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/17/22.
//

import SwiftUI

struct EatOrderDetailsView: View {

    // MARK: - PROPERTIES
    @ObservedObject var keyboardResponder = KeyboardResponder()
    @Binding var rootIsActive : Bool
    @State private var detailText = ""
    let description = """
    Type something like this:

        - No Lettuce
        - Cheese
        - Onions
        - Jalepeneos
    """

    let restaurant: String
    let foodType: String
    @State private var didClick:Bool = false

    // MARK: - BODY
    var body: some View {
        VStack{
            
            HStack{
                Text("Enter your meal instructions below")
                    .multilineTextAlignment(.leading)
                    .padding()
                    .padding(.top, 0)
                    .padding(.bottom, 0)

                Spacer()
                
            } //: HSTACK
            //.offset(y:-keyboardResponder.currentHeight)

            
            HStack {
                VStack(alignment: .leading){
                    
                    Text("Bonny Castle")
                        .font(.title2)
                    
                    Text("Sandwich")
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                } //: VSTACK
                .padding()
                
                Spacer()
            } //: HSTACK
            //.offset(y:-keyboardResponder.currentHeight)
            
            
            TextEditor(text: self.$detailText)
                .foregroundColor(self.detailText == description ? .gray : .black)
                .padding()
                .multilineTextAlignment(.leading)
                .onTapGesture {
                    didClick = true
                    if self.detailText == description{
                        self.detailText = ""
                    }
                }
               // .offset(y: keyboardResponder.currentHeight * 0.1)
            
            // Continue Button
            NavigationLink(destination: {
                
                // Segue to payment view
                EatPaymentView(mealDetails: detailText, restaurant: restaurant, foodType: foodType, rootIsStillActive: $rootIsActive)
                
            }, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .modifier(ButtonModifier())
            })
            //.offset(y: keyboardResponder.currentHeight * 0.2)
            
            
        } //: VSTACK
        .onDisappear(){
            didClick = false
        }
        .navigationTitle("Order Details")
        .onAppear{
            self.detailText = description
        }
        if(didClick){
            Spacer(minLength: 30)
        }
        else{
            Spacer(minLength: 125)
        }
        //.offset(y: -keyboardResponder.currentHeight * 0.5)

    }
}

// MARK: - PREVIEW
//struct EatOrderDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        EatOrderDetailsView(restaurant: "Bonny Castle", foodType: "Sandwich")
//    }
//}
