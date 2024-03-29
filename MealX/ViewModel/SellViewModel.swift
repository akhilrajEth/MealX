//
//  SellViewModel.swift
//  MealX
//
//  Created by Akhil Maheepathi on 9/19/22.
//

import Foundation
import FirebaseFirestore
import Firebase
import UIKit

class SellViewModel : ObservableObject{
    
    @Published var currentUser = Auth.auth().currentUser
    @Published var orders = [Order]()
    @Published var sellerOrders = [Order]()
    private var db = Firestore.firestore()

    func getOrderData(){
        //return all data in order collection to display in SellHomeView
        db.collection("orders").addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }
            
            self.orders = documents.map{ (queryDocumentSnapshot) -> Order in
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
        
    } //: GET ORDER DATA

    func uploadScreenshot(image: UIImage, uid: String, order: Order){

        // Create a reference to the database
        let db = Firestore.firestore()

        ImageUploader.uploadImage(image: image, type: "screenshots") { screenshotURL in

            // Add a document to user's values collection
            db.collection("orders").document(uid).updateData(["screenshot_url": screenshotURL]) { error in

                // Check for errors
                if error == nil {
                    // No errors
                    print("Success!")
                } else {
                    // Handle the error
                    print("Here's the error: \(String(describing: error?.localizedDescription))")
                    return
                }

            }

            self.updateScreenshot(url: screenshotURL, order: order)

        } //: ImageUploader

    } //: FUNC UPLOAD SCREENSHOT

    
    func updateStatus(orderID:String, status: Bool){
        guard let uid = self.currentUser?.uid else { return }
        db.collection("orders").document(orderID).updateData(["pending": status]){
            error in
            
            if error == nil{
                print("Success")
            }
            
            else{
                print("Here's the error: \(String(describing: error?.localizedDescription))")
                return
            }
        }
        
        db.collection("users").document(uid).collection("requested_orders").document(orderID).updateData(["pending": status]){
            error in
            
            if error == nil{
                print("Success")
            }
            
            else{
                print("Here's the error: \(String(describing: error?.localizedDescription))")
                return
            }
        }
        
    } //: FUNC UPDATE STATUS

    func updateComplete(order: Order, status: Bool){

        db.collection("users").document(order.orderFrom).collection("requested_orders").document(order.id).updateData(["completed": status]){
            error in

            if error == nil{
                print("Success")
            }

            else{
                print("Here's the error: \(String(describing: error?.localizedDescription))")
                return
            }
        }
        db.collection("orders").document(order.id).updateData(["completed": status]){
            error in

            if error == nil{
                print("Success")
            }

            else{
                print("Here's the error: \(String(describing: error?.localizedDescription))")
                return
            }
        }



    } //: FUNC UPDATE STATUS

    func updateScreenshot(url: String, order: Order){

        db.collection("users").document(order.orderFrom).collection("requested_orders").document(order.id).updateData(["screenshot_url": url]){
            error in

            if error == nil{
                print("Success")
            }

            else{
                print("Here's the error: \(String(describing: error?.localizedDescription))")
                return
            }
        }


    } //: UPDATE SC

    func moveOrder(order: Order, userUID: String){

        // Add data to seller's completed orders
        db.collection("users").document(userUID).collection("completed_orders").document(order.id).setData(["restaurant": order.restaurant, "meal_type": order.mealType, "order_details": order.orderDetails, "completed": order.completed, "order_from": order.orderFrom, "pending": order.pending]){ _ in

            print("User data successfully uploaded.")
        }

    } //: FUNC MOVE ORDER

    func deleteOrder(order: Order, userUID: String){

        // Delete data from main collection
        db.collection("orders").document(order.id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    } //: DELETE ORDER

    // Fetch seller's completed orders
    func fetchSellerOrders(sellerUID: String){

        db.collection("users").document(sellerUID).collection("completed_orders").addSnapshotListener{ (querySnapshot, error) in

            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }

            self.sellerOrders = documents.map{ (queryDocumentSnapshot) -> Order in

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

    } //: FUNC FETCH SELLER'S ORDERS
}

