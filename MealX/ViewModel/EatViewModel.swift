//
//  EatViewModel.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/18/22.
//

import Foundation
import Firebase


class EatViewModel: ObservableObject {

    // MARK: - PROPERTIES
    @Published var currentUser = Auth.auth().currentUser
    @Published var eaterOrders = [Order]()
    @Published var privateEaterOrders = [Order]()

    init(){
        fetchEatersOrders()
    }

    func setOrderData(restaurant: String, mealType: String, orderDetails: String, completed: Bool){

        // Retrieves uid of current user
        guard let uid = self.currentUser?.uid else { return }
        let docID = UUID().uuidString
        // Adds user's order into firebase
        Firestore.firestore().collection("orders").document(docID).setData(["restaurant": restaurant, "meal_type": mealType, "order_details": orderDetails, "completed": completed, "order_from": uid, "pending": false]){ _ in

            print("User data successfully uploaded.")
        }

        // Add user's order into private collection
        Firestore.firestore().collection("users").document(uid).collection("requested_orders").document(docID).setData(["restaurant": restaurant, "meal_type": mealType, "order_details": orderDetails, "completed": completed, "order_from": uid, "pending": false]){ _ in

            print("User data successfully uploaded.")
        }

    } //: POSTS ORDER DATA TO BACKEND


    // Get order data
    func fetchEatersOrders (){

        // Retrieves uid of current user
        guard let uid = self.currentUser?.uid else { return }

        Firestore.firestore().collection("users").document(uid).collection("requested_orders").addSnapshotListener{ (querySnapshot, error) in

            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }

            self.eaterOrders = documents.map{ (queryDocumentSnapshot) -> Order in

                let data = queryDocumentSnapshot.data()

                let mealType = data["meal_type"] as? String ?? ""
                let orderDetails = data["order_details"] as? String ?? ""
                let orderFrom = data["order_from"] as? String ?? ""
                let completed = data["completed"] as? Bool ?? false
                let restaurant = data["restaurant"] as? String ?? ""
                let status = data["pending"] as? Bool ?? false
                let uid = queryDocumentSnapshot.documentID
                let screenshotURL = data["screenshot_url"] as? String ?? ""


                return Order(id:uid,mealType: mealType, orderDetails: orderDetails, orderFrom: orderFrom, completed: completed, restaurant: restaurant, pending: status, screenshotURL: screenshotURL)
            }
        }

    } //: FUNC GET ORDER DATA


    // Fetch private order data
    func fetchPrivateOrders (uid: String){

        Firestore.firestore().collection("users").document(uid).collection("requested_orders").addSnapshotListener{ (querySnapshot, error) in

            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }

            self.privateEaterOrders = documents.map{ (queryDocumentSnapshot) -> Order in

                let data = queryDocumentSnapshot.data()

                let mealType = data["meal_type"] as? String ?? ""
                let orderDetails = data["order_details"] as? String ?? ""
                let orderFrom = data["order_from"] as? String ?? ""
                let completed = data["completed"] as? Bool ?? false
                let restaurant = data["restaurant"] as? String ?? ""
                let status = data["pending"] as? Bool ?? false
                let uid = queryDocumentSnapshot.documentID
                let screenshotURL = data["screenshot_url"] as? String ?? ""


                return Order(id:uid,mealType: mealType, orderDetails: orderDetails, orderFrom: orderFrom, completed: completed, restaurant: restaurant, pending: status, screenshotURL: screenshotURL)
            }
        }

    } //: FUNC GET ORDER DATA
}

