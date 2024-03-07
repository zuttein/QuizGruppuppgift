//
//  PlayerSetupView.swift
//  QuizGruppuppgift
//
//  Created by Joakim.Bjärkstedt on 2024-02-29.
//

import SwiftUI

struct PlayerSetupView: View {
    
    @State var selectionNumberOfPlayers = ""
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var dataController = DataController()
    @State var header: String = "Player Setup"
    @State var difficulty: String = "Katastrof"
    @State var playerNames:[String]=[]
    let maxPlayers = 10
    var body: some View {
        
        ZStack{
            Color.offwhite
                .ignoresSafeArea()
            VStack{
                
                Text(header)
                    .font(.title)
                    .padding(0)
                
                
                List{
                    ForEach(0..<playerNames.count, id: \.self) {index in
                        TextField("Player\(index + 1)",text: $playerNames[index])
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    }
                    
                    
                }
                Text("Kategorier")
                    .font(.system(size: 16, weight: .bold))
                    .accentColor(.black)
                    .frame(width: 100, height: 15)
                List{
                    Text("Sport")
                    Text("Mat")
                    Text("Historia")
                }.padding(.bottom,125)
                
                
                Text("Svårighetsgrad: \(difficulty) ")
                
                Button(action: {
                    
                }) {
                    Text("Starta spel")
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
    

#Preview {
    PlayerSetupView()
}
