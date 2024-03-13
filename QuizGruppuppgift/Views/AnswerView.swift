//
//  AnswerView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import SwiftUI
import SwiftData

struct AnswerView: View {
    
    @Environment(\.modelContext) var modelContext

    //Dummies eftersom det inte finns någon tillagd i Player klassen
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var dataController: DataController
        

    var body: some View {
        
        ZStack {
            Color.offwhite
                .ignoresSafeArea()
            VStack {
                Text("Show Correct Answer")
                    .font(.largeTitle)
                    .padding(.top, 100)
                
                Spacer()
                
                List(viewModel.players, id: \.id) { player in
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
                             
                             
                             //lägger till progressbar för att se progress brevid score
                             ProgressView(value: Float(player.score) / Float(dataController.numberOfQuestions))
                                                        .frame(width: 100, height: 10)
                             

                         }
                         .listRowBackground(Color.offwhite)
                                                
                     }
                .scrollContentBackground(.hidden)
                .padding(.top, 50)
                
                
                
                
                Button(action: {
                
                    if dataController.questions.isEmpty {
                        saveGame()
                        viewModel.showFinishV()
                        
                    } else {
                        dataController.questions.remove(at: 0)
                        if dataController.questions.isEmpty {
                            saveGame()
                            viewModel.showFinishV()
                        } else {
                            viewModel.showQuestionV()
                        }
                    }
                    
                }) {
                    Text(dataController.questions.isEmpty ? "Game Ended" : "Next Question")
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
    
    func saveGame(){
        
        viewModel.gameToSave()
        
        modelContext.insert(viewModel.currentGame)

        
        withAnimation {
            viewModel.gameEnded.toggle()
        }
    }
    
}

    
//#Preview {
//    AnswerView()
//}
