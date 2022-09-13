//
//  ContentView.swift
//  Shared
//
//  Created by Akhil Maheepathi on 8/15/22.
//

import SwiftUI

struct IntentView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack{
            VStack {
                Image("MealX_Logo")
                    .resizable()
                    .frame(width:320, height:150)
            }
            .offset(y:200)
            Spacer()
            
            Button(){
            
            } label: {
                Text("Eat")
                    .frame(height:30)
                    .frame(maxWidth: 200)
                    .font(.title2)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .buttonBorderShape(.capsule)
            .tint(.black)
            .offset(y:-275)
            Button(){
                appState.seller = true
            } label: {
                Text("Sell")
                    .frame(height:30)
                    .frame(maxWidth: 200)
                    .font(.title2)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .buttonBorderShape(.capsule)
            .tint(.black)
            .offset(y:-265)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.gray.opacity(0.4))
    }
}

struct IntentView_Previews: PreviewProvider {
    static var previews: some View {
        IntentView()
    }
}
