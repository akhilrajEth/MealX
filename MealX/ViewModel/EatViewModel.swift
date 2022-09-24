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


    func setOrderData(restaurant: String, mealType: String, orderDetails: String, payment: Bool){

        // Retrieves uid of current user
        guard let uid = self.currentUser?.uid else { return }

        // Adds user's order into firebase
        Firestore.firestore().collection("orders").document().setData(["restaurant": restaurant ?? "", "meal_type": mealType, "order_details": orderDetails, "payment": payment, "order_from": uid, "pending": false]){ _ in

            print("User data successfully uploaded.")
        }

    } //: POSTS ORDER DATA TO BACKEND




}

