//
//  EatOrderView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/17/22.
//

import SwiftUI

struct EatOrderView: View {


    // MARK: - PROPERTIES
    var restaurants = ["Burrito Theory", "The Castle"]
    @State private var selectedRestaurant = "Burrito Theory"
    @State private var mealType = ""
    @State var isActive : Bool = false
    @ObservedObject var keyboardResponder = KeyboardResponder()

    @EnvironmentObject var appState: AppState

    
    // MARK: - BODY
    var body: some View {

        NavigationView {

            VStack {

                // Subtitle
                HStack{
                    Text("Start your order for a meal exchange.")
                        .multilineTextAlignment(.leading)
                        .padding()
                        .padding(.top, 0)
                        .padding(.bottom, 0)

                    Spacer()

                } //: HSTACK
                .offset(y: -keyboardResponder.currentHeight)

                Spacer()

                VStack{

                    VStack(alignment: .leading) {

                        Text("1. Where do you want your meal from?")
                            .font(.title3)
                            .bold()
                            .padding()
                            .padding(.bottom, 0)

                        Picker("Where do you want your meal from?", selection: $selectedRestaurant) {

                            ForEach(restaurants, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        .foregroundColor(Color.green)
                        .padding()
                        .padding(.top, 0)

                    } //: VSTACK

                    // Text fields for user inputs
                    CustomInputField(fieldTitle: "2. What kind of meal do you want?", placeholder: " e.g. Bowl, Burrito, Castle Bowl, Wrap", isSecureField: false, text: $mealType)


                    VStack(alignment: .leading) {

                        HStack{

                            VStack (alignment: .leading){
                                Text("3. What do you want in your meal?")
                                    .font(.title3)
                                    .bold()


                                Text("Please add any special instructions")
                            } //: VSTACK

                            Spacer()

                        } //: HSTACK

                        Button(action: {

                            self.isActive = true

                        }, label: {

                            Text("Enter instructions")
                                    .fontWeight(.semibold)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.green)
                                            .frame(width:170, height: 40)
                                    )
                                    .font(.callout)
                                    .foregroundColor(.white)
                        })
                        .padding()
                        .background(
                            NavigationLink(destination: EatOrderDetailsView(rootIsActive: $isActive, restaurant: selectedRestaurant, foodType: mealType),
                                           isActive: self.$isActive) {EmptyView()}
                        )

//                        NavigationLink(destination: {
//
//                            // Segue to add order view
//                            EatOrderDetailsView(restaurant: selectedRestaurant, foodType: mealType)
//
//                        }, label: {
//
//                            // Bring user to eat view
//                            Text("Enter instructions")
//                                .fontWeight(.semibold)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 8)
//                                        .fill(.green)
//                                        .frame(width:170, height: 40)
//                                )
//                                .font(.callout)
//                                .foregroundColor(.white)
//                        })
//                        .padding()

                    } //: VSTACK
                    .padding()

                    Spacer()


                }







            } //: VSTACK
            .offset(y: -keyboardResponder.currentHeight * 0.1)
            .navigationTitle("Order")

        } //: NAV VIEW
        .navigationViewStyle(.stack)
        .onTapGesture {
            self.hideKeyboard()
        }

    }
    
}





/*
// MARK: - PREVIEW
struct EatOrderView_Previews: PreviewProvider {
    static var previews: some View {
        EatOrderView()
    }
}
*/
