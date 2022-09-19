//
//  Order.swift
//  MealX
//
//  Created by Akhil Maheepathi on 9/19/22.
//

import Foundation

struct Order:Identifiable{
    var id:String = UUID().uuidString
    var mealType:String
    var orderDetails:String
    var orderFrom:String
    var payment:Bool
    var restaurant:String
}
