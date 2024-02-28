//
//  ContentView.swift
//  QuizGruppuppgift
//
//  Created by Dennis.Nilsson on 2024-02-26.
//

import SwiftUI


struct ContentView: View {
    
    @State var selectionCategory = ""
    @State var selectionNumberOfPlayers = ""
    @State var selectionDifficulty = ""
    
    let categories = ["Kategori1","Kategori2","Kategori3","Kategori4"]
    let numberOfPlayers = ["1","2","3","4"]
    let difficulty = ["Easy","Medium","Hard"]
    
    @State var playerViewIsPresented = false
    
    var body: some View {
        ZStack{
            Color.offwhite
                .ignoresSafeArea()
            
            VStack {
                Text("Coolt namn")
                    .font(.title)
                Image("Potatis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300,height: 300)
                    
                
                Spacer()
                
                Text("Välj Kategori")
                    .font(.headline)
                Picker("Kategori", selection: $selectionCategory){
                    ForEach(categories, id: \.self){
                        Text($0)
                        
                    }
                }
                
                
                .font(.system(size: 16, weight: .bold))
                .accentColor(.black)
                .frame(width: 150, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.offwhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    
                )
                
                
                
                Text("Välj Antal Spelare")
                    .font(.headline)
                Picker("Antal spelare", selection: $selectionNumberOfPlayers){
                    ForEach(numberOfPlayers, id: \.self){
                        Text($0)
                        
                    }
                }
                .font(.system(size: 16, weight: .bold))
                .accentColor(.black)
                .frame(width: 150, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.offwhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                )
                
                Text("Välj Svårhetsgrad")
                    .font(.headline)
                Picker("Svårhetsgrad", selection: $selectionDifficulty){
                    ForEach(difficulty, id: \.self){
                        Text($0)
                        
                    }
                }
                .font(.system(size: 16, weight: .bold))
                .accentColor(.black)
                .frame(width: 150, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.offwhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                )
                Spacer()
                
                
                
                HStack{
                    Button(action: {
                        playerViewIsPresented.toggle()
                    }) {
                        Text("Fortsätt")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color.black)
                            .frame(width: 150, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.offwhite)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                
                            )
                    }
                    .sheet(isPresented: $playerViewIsPresented){
                        PlayerUpdateView()
                    }
                    Button(action: {
                        
                    }) {
                        Text("Highscore")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color.black)
                            .frame(width: 150, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.offwhite)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            )
                    }
                    
                }
            }
            
        }
        
        
    }
}

#Preview {
    ContentView()
}
