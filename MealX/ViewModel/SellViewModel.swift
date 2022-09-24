//
//  SellViewModel.swift
//  MealX
//
//  Created by Akhil Maheepathi on 9/19/22.
//

import Foundation
import FirebaseFirestore
import Firebase

class SellViewModel : ObservableObject{
    @Published var orders = [Order]()
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
                let payment = data["payment"] as? Bool ?? false
                let restaurant = data["restaurant"] as? String ?? ""
                let status = data["pending"] as? Bool ?? false
                let uid = queryDocumentSnapshot.documentID
                
                
                return Order(id:uid,mealType: mealType, orderDetails: orderDetails, orderFrom: orderFrom, payment: payment, restaurant: restaurant, pending: status)
            }

        }
        
    }
    func setCompletedOrder(){
        
    }
    
    func updateStatus(uid:String, status: Bool){
        db.collection("orders").document(uid).updateData(["pending": status]){
            error in
            
            if error == nil{
                print("Success")
            }
            
            else{
                print("Here's the error: \(error?.localizedDescription)")
                return
            }
        }
    }
    
}
