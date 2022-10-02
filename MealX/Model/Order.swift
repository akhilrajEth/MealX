//
//  Order.swift
//  MealX
//
//  Created by Akhil Maheepathi on 9/19/22.
//

import Foundation

struct Order:Identifiable {

    var id:String
    var mealType:String
    var orderDetails:String
    var orderFrom:String
    var completed:Bool
    var restaurant:String
    var pending:Bool = false
    var screenshotURL:String

}
