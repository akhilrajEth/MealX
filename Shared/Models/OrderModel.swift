//
//  BuyerInfo.swift
//  MealX (iOS)
//
//  Created by Akhil Maheepathi on 8/23/22.
//

import Foundation
/*
class Buyer: ObservableObject{
    @Published var restaurant : String = ""
    @Published var order = []
    var id = UUID()

}
*/
public struct Order: Codable{
    var restaurant:String
    var order:Array<String>

    enum CodingKeys: String, CodingKey{
        case restaurant
        case order
    }
}
