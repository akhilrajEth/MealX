//
//  EatPaymentView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/17/22.
//

import SwiftUI

struct EatPaymentView: View {

    // MARK: - PROPERTIES
    let mealDetails: String
    let restaurant: String
    let foodType: String
    @State var showingAlert = false
    @State var orderComplete = false
    @Binding var rootIsStillActive : Bool
    @ObservedObject var viewModel = EatViewModel()

    @EnvironmentObject var appState: AppState
    
    @State var didPay:Bool = false


    // MARK: - BODY
    var body: some View {
     
        VStack(spacing: 0){
            // Price
            VStack{
                HStack{
                    Text("$5.29")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    Spacer()
                } //: HSTACK
                
                // Restaurant and meal type
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
                .offset(y:-30)
            }
            Spacer()

            HStack{
                let text = mealDetails
                let test = String(text.filter{!"\n\t".contains($0)})
                let final = test.replacingOccurrences(of: " ", with: ",", options: .literal, range: nil)
                Text(final)
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()
            }
            .offset(y:-110)
            
            HStack{
                Spacer()
                
                Link("Pay With Paypal", destination: .init(string: "https://paypal.me/MealXUVA")!)
                    .font(.title3)
                    .foregroundColor(.white)
                    .simultaneousGesture(
                                TapGesture()
                                    .onEnded { _ in
                                        didPay = true
                                        print(didPay)
                                    }
                            )
                    .background(RoundedRectangle(cornerRadius: 14)
                        .fill(Color.blue)
                        .frame(width: 320,height:50))
                    .frame(width:320)
                
                Spacer()
            }
            .offset(y:-30)
            
            HStack{
                Spacer()
                
                Link("Pay With Venmo: @MealX", destination: .init(string: "https://get.venmo.com")!)
                    .font(.title3)
                    .foregroundColor(.white)
                    .simultaneousGesture(
                                TapGesture()
                                    .onEnded { _ in
                                        didPay = true
                                        print(didPay)
                                    }
                            )
                    .background(RoundedRectangle(cornerRadius: 14)
                        .fill(Color.blue)
                        .frame(width: 320,height:50))
                    .frame(width:320)
                
                Spacer()
            }
            Spacer()
            
            if(didPay == true){
                VStack{
                    Button(action: {
                        
                        // Add PayPal link to button
                        
                        // Set order data
                        viewModel.setOrderData(restaurant: restaurant, mealType: foodType, orderDetails: mealDetails, completed: orderComplete)
                        
                        // Notify user that order was successful
                        showingAlert.toggle()
                        
                        
                        
                        
                    }, label: {
                        Text("I Paid")
                            .fontWeight(.bold)
                            .modifier(ButtonModifier())
                    })
                    .padding()
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Order successful!"), message: Text("You can view the status of your order in your profile tab."), dismissButton: .default(Text("Okay"), action: {
                            
                            // Segue back to order view
                            rootIsStillActive = false
                        }))
                    }
                    
                    Text("* once payment is confirmed and order is fufilled you will receive a screenshot containing order information *")
                        .frame(width:300,height:100)
                }
              
            }

            Spacer()


        } //: VSTACK
        .navigationTitle("Payment")


    }
}
extension String{
    func withReplacedCharacters(_ oldChar: String, by newChar: String) -> String{
        let newStr = self.replacingOccurrences(of: oldChar, with: newChar, options: .literal, range: nil)
        return newStr
    }
}

// MARK: - PREVIEW
//struct EatPaymentView_Previews: PreviewProvider {
//    static var previews: some View {
//        EatPaymentView(mealDetails: "Lettuce, Cheese, Onions", restaurant: "Bonny", foodType: "Sandwich")
//    }
//}
