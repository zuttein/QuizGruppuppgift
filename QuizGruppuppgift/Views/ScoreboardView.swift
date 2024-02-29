//
//  ScoreboardView.swift
//  QuizGruppuppgift
//
//  Created by Katja Klahr on 2024-02-27.
//

import SwiftUI

struct ScoreboardView: View {
    @ObservedObject var viewModel = ViewModel()
    
    
    var body: some View {
        ZStack{
            Color.offwhite
                .ignoresSafeArea()
            
            VStack {
                Text("Results")
                    .font(.title)

                List {
                    /*ForEach(viewModel.gameScores) { gameScore in
                        VStack(alignment: .leading) {
                            Text("Timestamp: \(gameScore.timestamp ?? Date())")
                            Text("Category: \(gameScore.category ?? "")")
                            
//                            ForEach(Array(arrayLiteral: gameScore.playerScores), id: \.self) { playerScore in
//                                Text("Player Name: \(playerScore.name ?? "") - Score: \(playerScore.score)")
                            }
                        }*/
                    }
                }
                
                Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Back")
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

#Preview {
    ScoreboardView()
}
