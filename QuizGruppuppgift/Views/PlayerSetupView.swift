//
//  PlayerSetupView.swift
//  QuizGruppuppgift
//
//  Created by Joakim.Bjärkstedt on 2024-02-28.
//

import SwiftUI

struct PlayerUpdateView: View {
    
    @State var selectionNumberOfPlayers = ""
    @ObservedObject var viewModel = ViewModel()
    @State var header: String = "Player Setup"
    @State var difficulty: String = "Katastrof"
    var body: some View {
        
        ZStack{
            Color.offwhite
                .ignoresSafeArea()
            VStack{
                
                Text(header)
                    .font(.title)
                    .padding(0)
                List{
                   
//                    HStack{
//                        
//                        TextField("Ange namn:",text: $playerName[1])
//                    Image(systemName: "circle")}
//                    HStack{
//                        TextField("Ange namn:",text: $playerName[2])
//                        Image(systemName: "circle")}
//                    HStack{
//                        TextField("Ange namn:",text: $playerName[3])
//                    Image(systemName: "circle")}
//                    HStack{
//                        TextField("Ange namn:",text: $playerName[4])
//                    Image(systemName: "circle")}
//                    HStack{
//                        TextField("Ange namn:",text: $playerName[5])
//                    Image(systemName: "circle")}
//                    HStack{
//                        TextField("Ange namn:",text: $playerName[6])
//                    Image(systemName: "circle")}
//                    HStack{
//                        TextField("Ange namn:",text: $playerName[7])
//                    Image(systemName: "circle")}
//                    HStack{
//                        TextField("Ange namn:",text: $playerName[8])
//                    Image(systemName: "circle")}
//                    HStack{
//                        TextField("Ange namn:",text: $playerName[9])
//                    Image(systemName: "circle")}
//                    HStack{
//                        TextField("Ange namn:",text: $playerName[10])
//                    Image(systemName: "circle")}
//
                    
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
    PlayerUpdateView()
}
