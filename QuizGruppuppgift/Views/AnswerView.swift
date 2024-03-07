//
//  AnswerView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import SwiftUI

struct AnswerView: View {
    var onSaveGame: () -> Void // Closure to save the game
    
    @Binding var showQuestionView: Bool
    @Binding var showAnswerView: Bool
    
    //Dummies eftersom det inte finns någon tillagd i Player klassen
    var players: [Player] = [
          Player(id: UUID(), name: "Jan", score: 100),
          Player(id: UUID(), name: "Janne", score: 150),
          Player(id: UUID(), name: "Janna", score: 75),
          Player(id: UUID(), name: "Jan", score: 100),
          Player(id: UUID(), name: "Janne", score: 150),
          Player(id: UUID(), name: "Janna", score: 75),
          Player(id: UUID(), name: "Janna", score: 75),
          Player(id: UUID(), name: "Jan", score: 100),
          Player(id: UUID(), name: "Janne", score: 150),
          Player(id: UUID(), name: "Janna", score: 75)
      ]
    
    
    var body: some View {
        
        ZStack {
            Color.offwhite
                .ignoresSafeArea()
            VStack {
                Text("Show Correct Answer")
                    .font(.largeTitle)
                    .padding(.top, 100)
                
                Spacer()
                
                List(players, id: \.id) { player in
                         HStack {
                             Text("Name: \(player.name)")
                                 .font(.headline)
                                 .padding(5)
                                 .background(
                                     RoundedRectangle(cornerRadius: 10)
                                         .foregroundColor(Color.offwhite)
                                         .shadow(color: Color.black.opacity(1.0), radius: 5, x: 0, y: 2)
                                         
                                 )
                            Spacer()
                             Text("Points: \(player.score)")
                                 .font(.headline)
                                 .padding(5)
                                 .background(
                                     RoundedRectangle(cornerRadius: 10)
                                         .foregroundColor(Color.offwhite)
                                         .shadow(color: Color.black.opacity(1.0), radius: 5, x: 0, y: 2)
                                 )
                         }
                         .listRowBackground(Color.offwhite)
                        
                        
                     }
                .scrollContentBackground(.hidden)
                .padding(.top, 50)
                
                
                
                
                HStack{
                    Button(action: {
                    
                        //Ta bort första frågan i DataController.shared.questions, så att nästa fråga visas när man kommer in i QuestionView,
                        //alt. att man kommer till FinishView om det itne finns fler frågor (logik nedan)
                        
                        showAnswerView = false
                        
                        if DataController.shared.questions.isEmpty {
                            print("Game ended")
                        
                        } else {
                            showQuestionView = true
                        
                            
                        }
                    }) {
                        Text("Next Question")
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
    
//#Preview {
//    AnswerView()
//}
