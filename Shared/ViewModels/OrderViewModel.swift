//
//  OrderViewModel.swift
//  MealX
//
//  Created by Akhil Maheepathi on 8/24/22.
//

import Foundation

import FirebaseCore
import FirebaseFirestore

import Combine


class OrderViewModel: ObservableObject{
    //var order: Order = Order(restaurant: "Burrito Theory", order: ["beans", "rice", "chicken"])
    //@Published var order: Order = Order(restaurant: "BurritoTheory", order: ["beans","rice","chicken"])
    
    
    /*let docData:[String:Any] = [
        "restaurant":"Burrito Theory",
        "order":"beans",
    ]*/
    private let db = Firestore.firestore()
    
    func addOrder(order:Order){
        //let _ = try db.collection("Orders").addDocument(from: order)
        //let _ = try.db.collection("Orders").
    }
  
}
