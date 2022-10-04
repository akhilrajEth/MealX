//
//  KeyboardResponder.swift
//  MealX
//
//  Created by Akhil Maheepathi on 10/4/22.
//

import Foundation
import SwiftUI

class KeyboardResponder:ObservableObject{
    @Published var currentHeight: CGFloat = 0
    
    
    @objc func keyBoardWillShow(notification: Notification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            withAnimation{
                currentHeight = keyboardSize.height
            }
        }
    }
    
    @objc func keyBoardWillHide(notification: Notification){
        withAnimation{
            currentHeight = 0
        }
    }
    
    var _center: NotificationCenter
    init(center: NotificationCenter = .default){
        _center = center
        
        
        _center.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        _center.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }


}

