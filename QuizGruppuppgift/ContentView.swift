//
//  ContentView.swift
//  QuizGruppuppgift
//
//  Created by Dennis.Nilsson on 2024-02-26.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    @State var selectionCategory = ""
    @State var selectionNumberOfPlayers = 1
    @State var selectionDifficulty = ""
    
    
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
                    ForEach(viewModel.game) { game in
                        Text("Kategori: \(game.category ?? "")")
                    }
                }
       
                .font(.system(size: 16, weight: .bold))
                .accentColor(.black)
                .frame(width: 150, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.offwhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2))
                
                
                
                Text("Välj Antal Spelare")
                    .font(.headline)
                Picker("Antal Spelare", selection: $selectionNumberOfPlayers){
                    ForEach(viewModel.game) { game in
                        Text("Antal Spelare: \(game.playerAmount)")
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
                Picker("Svårhetsgrad", selection: $selectionDifficulty) {
                    ForEach(viewModel.game) { game in
                        Text("Svårhetsgrad: \(game.difficulty ?? "")")
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
