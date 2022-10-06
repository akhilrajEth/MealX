//
//  CustomInputField.swift
//  MealX
//
//  Created by Karthik  Ramu on 9/14/22.
//

import SwiftUI

struct CustomInputField: View {

    // MARK: - PROPERTIES
    let fieldTitle: String
    let placeholder: String
    let isSecureField: Bool?
    @Binding var text: String

    // MARK: - BODY
    var body: some View {

        VStack(alignment: .leading){

            Text(fieldTitle)
                .font(.title3)
                .fontWeight(.semibold)

            if isSecureField ?? false {
                SecureField(placeholder, text: $text)
                    .background(
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(height: 45)
                    )
                    .frame(height: 45)

            } else {
                TextField(placeholder, text: $text)
                    .background(
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(height: 45)
                    )
                    .frame(height: 45)

            }

        }//: VSTACK
        .padding()
    }
}


// MARK: - PREVIEW
//struct CustomInputField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomInputField(fieldTitle: "test", isSecureField: false, text: .constant(""))
//    }
//}
