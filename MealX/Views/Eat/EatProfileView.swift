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
    @State private var sellView = false
    
    @EnvironmentObject var appState: AppState

    // MARK: - BODY
    var body: some View {

        Group {

            if sellView == true {
               QuickSelectView()
            } else {
                mainEatProfileView
            }
        } //: GROUP

    }
}


extension EatProfileView {

    var mainEatProfileView: some View {

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
                            // Switch to Sell
                            //sellView.toggle()
                            print(appState.rootViewId)
                            appState.rootViewId = UUID()
                            print(appState.rootViewId)
                        }, label: {
                            Text("Switch to Sell")
                                .foregroundColor(.blue)
                        })
                    } //: VSTACK
                    .padding()

                    Spacer()

                } //: HSTACK


                VStack(alignment:.leading){

                    HStack{
                        Text("Your Orders")
                            .fontWeight(.semibold)
                            .font(.title3)
                            .padding()
                        Spacer()
                    }

                    Text("Click on a Completed order to view your screenshot.")
                        .padding(.leading, 15)

                    ScrollView {
                        LazyVStack {
                            ForEach(eatViewModel.eaterOrders) { order in
                                    EatOrderCell(order: order)
                            } // FOR EACH
                        } // LAZY V STACK
                    } // SCROLL VIEW
                    .onAppear(){
                        self.eatViewModel.fetchEatersOrders()
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
struct EatProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EatProfileView()
            .environmentObject(AuthViewModel())
    }
}
