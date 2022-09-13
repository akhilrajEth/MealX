//
//  ListOrders.swift
//  MealX
//
//  Created by Akhil Maheepathi on 8/15/22.
//

import SwiftUI




struct ListOrders: View {
    //@ObservedObject var buyerProfile = Buyer()
    
    @State var scrollOffset: CGFloat = .zero
    @State var scrollToTop = false
    
    private var hasScrolled: Bool{
        scrollOffset > 0
    }
    @State private var refresh = UUID()
    @EnvironmentObject var appState: AppState
    private var headingColor: Color = Color(red: 0.02, green: 0.56, blue: 0.31)
    var body: some View {
        VStack{
            NavigationView{
                ScrollView(.vertical, showsIndicators: true){
                    VStack(spacing: 30){
                        ForEach(0..<10){
                            item in
                            NavigationLink(destination: SellerFulfill().onDisappear(){refresh = UUID()}){
                                GeometryReader{
                                    geometry in
                                    VStack{
                                        Image("BTheory_Logo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 200, height: 200)
                                            .offset(y:-60)
                                        
                                        Text("Cilantro Lime Rice, Adobo Chicken, Pinto beans, beverage, cheese blend, peppers & onions, corn")
                                        
                                            .font(.title)
                                            .foregroundColor(Color(red: 0.00, green: 0.35, blue: 0.31))
                                            .offset(y:-90)
                                    
                                    }
                                    .frame(width: 400, height: 300)
                                    .background(Color(red: 0.84, green: 0.76, blue: 0.63))
                                    .cornerRadius(30)
                                    .shadow(radius: 5)

                                }
                                .frame(width: 400, height: 300)
                            }
                        }
                    }
                }
                .frame(width: 500)
                .navigationTitle("Orders")
                .toolbar(content: {ToolbarItem(placement: .navigationBarTrailing, content: {
                    HStack{
                        Image("Coin2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .offset(y:15)
                    }
                })}).id(refresh)
                .navigationViewStyle(StackNavigationViewStyle())
                

                /*
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        HStack{
                            Image("Coin2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .offset(y:60)
                            }
                        Text("exchanges\navailable")
                            .offset(y:45)
                    }
                */
            
            }

        }
    }
       
}



struct ListOrders_Previews: PreviewProvider {
    static var previews: some View {
        ListOrders()
    }
}


