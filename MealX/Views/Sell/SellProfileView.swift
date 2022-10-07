//
//  SellProfileView.swift
//  MealX
//
//  Created by Akhil Maheepathi on 9/17/22.
//

import SwiftUI

struct SellProfileView: View {

    // MARK: - PROPERTIES
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var sellViewModel = SellViewModel()
    @State private var showingAlert = false
    @State private var mode = 0
    
    @EnvironmentObject var appState: AppState

    // MARK: - BODY
    var body: some View {

        NavigationView {

            VStack{

                HStack{
                    VStack(alignment: .leading) {
                        Text(viewModel.currentUser?.name ?? "")
                            .font(.title)
                            .foregroundColor(.black)

                        Text(viewModel.currentUser?.email ?? "")
                            .foregroundColor(.gray)

                        Button(action: {
                            // Switch to Eat
                            print(appState.rootViewId)
                            appState.rootViewId = UUID()
                            print(appState.rootViewId)
                        }, label: {
                            Text("Switch to Eat")
                                .foregroundColor(.blue)
                        })
                    } //: VSTACK
                    .padding()
                    

                    Spacer()
                }

                VStack(alignment:.leading){

                    HStack{
                        Text("Your Orders")
                            .fontWeight(.semibold)
                            .font(.title3)
                            .padding()
                    }

                    Text("Here's all your fulfilled orders.")
                        .padding(.leading, 15)

                    ScrollView {
                        VStack(spacing:20) {
                            ForEach(sellViewModel.sellerOrders) { order in
                                ProfileOrderCell(restaurant: order.restaurant , mealType: order.mealType, orderDetails: order.orderDetails, order: order)
                                    
                            } // FOR EACH
                        } // LAZY V STACK
                    } // SCROLL VIEW
                    .onAppear(){
                        self.sellViewModel.fetchSellerOrders(sellerUID: viewModel.currentUser?.id ?? "")
                    }

                }//: VSTACK

            } //: VSTACK
            .navigationTitle("Profile")
            .toolbar{

                Menu {

                    // Button 1
                    Button(action: {
                        // Sign user out
                        viewModel.signOut()
                    }, label: {
                        Label("Sign Out", systemImage: "person.crop.circle.fill.badge.minus")
                            .foregroundColor(.red)
                    })

                    // Button 2
                    Button(action: {
                        showingAlert.toggle()
                    }, label: {
                        Label("Delete Account", systemImage: "trash.circle")
                            .foregroundColor(.red)
                    })
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Are you sure you want to delete your account?"), message: Text("You cannot undo this."), primaryButton: .destructive(Text("Delete"), action: {
                            viewModel.deleteUser()
                        }), secondaryButton: .cancel())
                    } //: END OF ALERT
                } label: {
                    Label("More", systemImage: "ellipsis.circle")
                }


            } //: TOOLBAR

            

        } //: NAV VIEW

    }
}


// MARK: - PREVIEW
//struct SellProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        SellProfileView().environmentObject(AuthViewModel())
//    }
//}
