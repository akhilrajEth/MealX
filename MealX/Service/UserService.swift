//
//  UserService.swift
//  MealX
//
//  Created by Karthik  Ramu on 10/1/22.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {


    // Fetches current user data
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){

        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let snapshot = snapshot else { return }

            guard let user = try? snapshot.data(as: User.self) else { return }

            completion(user)
        }
    } //: FETCH USER DATA

}
