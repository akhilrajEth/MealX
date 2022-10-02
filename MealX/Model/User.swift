//
//  User.swift
//  MealX
//
//  Created by Karthik  Ramu on 10/1/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {

    // Reads doc id from collection without having to duplicate it as a field
    @DocumentID var id: String?
    var email: String
    var name: String
    var pay_pal_link: String
}
