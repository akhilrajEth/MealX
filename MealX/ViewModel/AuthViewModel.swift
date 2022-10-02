//
//  AuthViewModel.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/14/22.
//

import Foundation
import Firebase


class AuthViewModel: ObservableObject {


    // MARK: - PROPERTIES
    @Published var userSession = Auth.auth().currentUser
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private let service = UserService()

    init(){
        // Sets user session to current user
        self.fetchUser()
        self.userSession = Auth.auth().currentUser
    }

    // Register user
    func register(name: String, withEmail email: String, password: String, payPalLink: String) {

        Auth.auth().createUser(withEmail: email, password: password) { result, error in

            // Check for error
            if let error = error {
                print("Could not create account with error \(error.localizedDescription).")
                return
            }


            // Saver user data to Firebase Firestore
            guard let user = result?.user else { return }

            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(["name": name, "email": email, "pay_pal_link": payPalLink]){ _ in
                    print("User data successfully uploaded.")
                    self.didAuthenticateUser = true
                }
        }

    } //: FUNC REGISTER
    
    //Get User
    func fetchUser(){
        guard let uid = self.userSession?.uid else { return }

        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }

    } // FETCH USER


    // Login user
    func logIn(withEmail email: String, password: String) {

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Could not login with error \(error.localizedDescription).")
                return
            }

            // Save user data to Firebase Firestore
            guard let user = result?.user else { return }
            self.userSession = user
        }
    } //: FUNC LOGIN

    // Sign user out
    func signOut() {

        // Sets user session to nil
        userSession = nil

        // Signs user out on backend
        try? Auth.auth().signOut()

    } //: FUNC SIGNOUT

    func deleteUser(){
        Auth.auth().currentUser?.delete { error in
                 if let error = error {
                     print("error deleting user - \(error)")
                 } else {
                     print("Account deleted")
                 }
             }

        userSession = nil

    } //: DELETE USER

}



