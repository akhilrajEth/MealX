//
//  SellerView.swift
//  MealX
//
//  Created by Akhil Maheepathi on 8/15/22.
//

import SwiftUI

struct SellerView: View {
    @EnvironmentObject var appState: AppState
    @State var selectedAmt = "Coin1"
    @State var tokenPrice: Float = 6.69
    @State var tokenAmt: Int = 1

    var body: some View {
        VStack {
            VStack{
                Button(action:{          appState.seller=false
                    appState.listOrders=false
                }){
                    HStack{
                        Image(systemName: "chevron.backward")
                        Text("home")
                    }
                }
                .offset(x:-150, y: -125)
            }
            HStack(){
                Button(action:{
                    selectedAmt = "Coin1"
                    tokenAmt = 1
                }){
                    Image("Coin1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                }
                //.frame(width: 0)
                
                
                Button(action:{
                    selectedAmt = "Coin2"
                    tokenAmt = 2
                }){
                    Image("Coin2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                }
                //.frame(width:0)
                Button(action:{
                    selectedAmt = "Coin3"
                    tokenAmt = 3
                }){
                    Image("Coin3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                }
                //.frame(width:0)
            }
            .offset(y:-80)
            HStack{
                Text("Selected:   ")
                    .offset(x:20,y:-20)
                    .font(.title)
                    .foregroundColor(Color.white.opacity(0.8))
                Spacer()
                Image(selectedAmt)
                    .resizable()
                    .scaledToFit()
                    .frame(width:100,height:100)
                Spacer()
                Text("Meal \nExchange")
                    .offset(x:-20,y:-20)
                    .font(.title3.italic())
                    .foregroundColor(Color.white)
                
            }
            .offset(y:-100)
            Text("Your Profit:")
                .font(.largeTitle)
                .bold()
                .offset(y:-50)
                .foregroundColor(Color(red: 0.02, green: 0.56, blue: 0.31))
            
            HStack{
                Text("$")
                    .font(.system(size:80))
                    .foregroundColor(Color.yellow)
                Text(String(tokenPrice * Float(tokenAmt) - 1))
                    .font(.system(size:60))
                    .foregroundColor(Color.white)
                
            }
            Button(){
                appState.listOrders = true
                appState.seller = false
            } label: {
                Text("Done")
                    .frame(height:30)
                    .frame(maxWidth: 200)
                    .font(.title2)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .buttonBorderShape(.capsule)
            .tint(Color(red: 0.00, green: 0.35, blue: 0.31))
            .offset(y:50)
           
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.black)
        
    }
    
}

struct SellerView_Previews: PreviewProvider {
    static var previews: some View {
        SellerView()
    }
}
