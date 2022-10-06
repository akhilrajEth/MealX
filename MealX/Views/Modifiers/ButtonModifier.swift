//
//  ButtonModifier.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/14/22.
//

import SwiftUI

struct ButtonModifier: ViewModifier {

    func body(content: Content) -> some View {

        content
            .foregroundColor(Color.white)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(.green)
                    .frame(width:320, height: 50)
            )
            .frame(width: 320)
    } // FUNC BODY
}
