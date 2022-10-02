//
//  EatProfileView.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/17/22.
//

import SwiftUI

struct EatProfileView: View {

    // MARK: - PROPERTIES
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var eatViewModel = EatViewModel()
    @State private var showingAlert = false

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
                    } //: VSTACK
                    .padding()

                    Spacer()
                }


                VStack(alignment:.leading){
                    Text("Your Orders")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .padding()

                    ScrollView {
                        LazyVStack {
                            ForEach(eatViewModel.eaterOrders) { order in
                                    EatOrderCell(order: order)
                            } // FOR EACH
                            .padding()

                        } // LAZY V STACK
                    } // SCROLL VIEW
                    .onAppear(){
                        self.eatViewModel.fetchEatersOrders()
                    }

                }//: VSTACK

            } //: VSTACK
            .navigationTitle("Profile")
            .toolbar{

                ToolbarItem(placement: .navigationBarTrailing){

                    Button(action: {
                        // Sign user out
                        viewModel.signOut()
                    }, label: {
                        Text("Sign Out")
                            .foregroundColor(.red)
                    })
                } //: TOOL BAR ITEM

                ToolbarItem(placement: .navigationBarLeading){

                    Button {
                        // Delete user account
                        showingAlert.toggle()
                    } label: {
                        Text("Delete Account")
                            .foregroundColor(.red)
                            .padding(.leading, 0)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Are you sure you want to delete your account?"), message: Text("You cannot undo this."), primaryButton: .destructive(Text("Delete"), action: {
                            viewModel.deleteUser()
                        }), secondaryButton: .cancel())
                    }
                } // TOOL BAR ITEM

            } //: TOOLBAR



        } //: NAV VIEW
    }
}


// MARK: - PREVIEW
struct EatProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EatProfileView()
            .environmentObject(AuthViewModel())
    }
}
