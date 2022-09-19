//
//  ImageUploader.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/18/22.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {

    static func uploadImage(image: UIImage, type: String, completion: @escaping(String) -> Void) {

        guard let imageData = image.jpegData(compressionQuality: 0.4) else { return }

        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/\(type)/\(filename)")

        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Failed to upload image with \(error.localizedDescription)")
                return
            }

            ref.downloadURL { imageURL, _ in
                guard let imageURL = imageURL?.absoluteString else {return}
                completion(imageURL)

            }
        }

    }
}
