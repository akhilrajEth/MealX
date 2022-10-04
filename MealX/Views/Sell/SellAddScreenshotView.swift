//
//  ScreenshotView.swift
//  MealX
//
//  Created by Akhil Maheepathi on 9/17/22.
//

import SwiftUI

struct SellAddScreenshotView: View {

    // MARK: - PROPERTIES
    @ObservedObject private var viewModel = SellViewModel()
    @ObservedObject var eatViewModel = EatViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var showCompleteView = false
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var postImage: Image?
    let order: Order


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
                Button(action: {

                    // Upload screenshot data to Firebase Storage
                    addScreenshot()

                    // Toggle the completed var in the order object
                    updateComplete()

                    // Move order into user's private collection of orders
                    viewModel.moveOrder(order: order, userUID: authViewModel.currentUser?.id ?? "")

                    // Delete order from main collection once updated
//                    viewModel.deleteOrder(order: order, userUID: authViewModel.currentUser?.id ?? "")

                    // Toggle the show complete var
                    showCompleteView.toggle()

                }, label: {

                    Text("Fullfill")
                        .fontWeight(.bold)
                        .modifier(ButtonModifier())
                })
                .sheet(isPresented: $showCompleteView, content: {
                    EatOrderCompleteView(title: "Complete!", message: "You’re all done! You should see this completed order in your profile page." )
                })
            }

            Spacer()

        } //: VSTACK
        .navigationTitle("Add Screenshot")
        .onAppear{
            eatViewModel.fetchEatersOrders()
            print("URLLLL")
            print(order.screenshotURL)
        }
    }

    func addScreenshot() {
        // Add screenshot to firebase
        viewModel.uploadScreenshot(image: selectedImage!, uid: order.id, order: order)
    } //: ADD SCREENSHOT

    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    } //: LOAD IMAGE

    func updateComplete(){
        print("SC URL")
        print(order.screenshotURL)
        viewModel.updateComplete(order: order, status: true)
    } //: UPDATE COMPLETe

}


// MARK: - PREVIEW
//struct ScreenshotView_Previews: PreviewProvider {
//    static var previews: some View {
//        SellAddScreenshotView(order: order)
//    }
//}
