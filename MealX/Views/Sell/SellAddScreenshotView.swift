//
//  ScreenshotView.swift
//  MealX
//
//  Created by Akhil Maheepathi on 9/17/22.
//

import SwiftUI

struct SellAddScreenshotView: View {

    // MARK: - PROPERTIES
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var postImage: Image?

    // MARK: - BODY
    var body: some View {

        VStack {

            // Subtitle
            HStack{
                Text("Take a screenshot of your Grubhub order and upload it below. ")
                    .multilineTextAlignment(.leading)
                    .padding()
                    .padding(.top, 0)
                    .padding(.bottom, 0)

                Spacer()

            } //: HSTACK

            Spacer()

            Button {
                showImagePicker.toggle()
            } label: {

                if let postImage = postImage{
                    postImage
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 250, height: 250, alignment: .center)
                } else {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .scaledToFit()
                            .cornerRadius(15)
                            .foregroundColor(Color.gray)
                            .opacity(0.2)
                            .frame(width: 300, height: 300)

                        VStack(spacing: 15) {
                            Image(systemName: "photo")
                                .foregroundColor(.blue)
                            Text("Add screenshot")
                                .foregroundColor(.blue)
                        } //: VSTACK
                    } // ZSTACK
                    .padding()
                }


            } //: BUTTON
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }

            Spacer()


            if let selectedImage = selectedImage {

                // Done button
                NavigationLink(destination: {

                    // Segue to order fullfilled page
                    EatOrderCompleteView(title: "Success!", message: "You’re all done! You should see this fullfilled order in your profile page." )

                }, label: {
                    Text("Continue")
                        .fontWeight(.bold)
                        .modifier(ButtonModifier())
                })
            }

            Spacer()


            
        } //: VSTACK
        .navigationTitle("Add Screenshot")
        
    }

    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    }
}

struct ScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        SellAddScreenshotView()
    }
}
