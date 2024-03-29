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
            Color.offWhite
                .ignoresSafeArea()
            VStack {
                if dataController.questions.isEmpty {
                      Text("No more questions available")
                    
                          .font(.largeTitle)
                          .frame(width: 300, height: 100)
                          .modifier(InnerNeumorphismModifier())
                  } else {
                      Text("Answer was: \(dataController.questions[0].answer)")
                          .font(.largeTitle)
                          .frame(width: 300, height: 100)
                          .modifier(InnerNeumorphismModifier())                  }
                
                Spacer()
                
                List(viewModel.players, id: \.id) { player in
                         HStack {
                             Text("Name: \(player.name)")
                                 .font(.headline)
                                 .padding(5)
                                 .background(
                                     RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.offWhite)
                                         .shadow(color: Color.black.opacity(1.0), radius: 5, x: 0, y: 2)
                                         
                                 )
                            Spacer()
                             Text("Points: \(player.score)")
                                 .font(.headline)
                                 .padding(5)
                                 .background(
                                     RoundedRectangle(cornerRadius: 10)
                                         .foregroundColor(Color.offWhite)
                                         .shadow(color: Color.black.opacity(1.0), radius: 5, x: 0, y: 2)
                                 )
                             
                             
                             //lägger till progressbar för att se progress brevid score
                             ProgressView(value: Float(player.score) / Float(dataController.numberOfQuestions))
                                                        .frame(width: 100, height: 10)
                                                        .padding(10)
                             
                             
                             

                         }
                         .listRowBackground(Color.offWhite)
                                                
                     }
                .scrollContentBackground(.hidden)
                .padding(.top, 50)
                
                
                
                
                Button(action: {
                
                    if dataController.questions.isEmpty {
                        saveGame(category: dataController.categorySelection)
                        viewModel.showFinishV()
                        
                        
                    } else {
                        dataController.questions.remove(at: 0)
                        if dataController.questions.isEmpty {
                            
                            saveGame(category: dataController.categorySelection)
                            viewModel.showFinishV()
                            SoundManager.instance.playSound(sound: .gamefinish)

                        } else {
                            viewModel.showQuestionV()
                        }
                    }
                    
                }) {
                    Text(dataController.questions.count <= 1 ? "End Game" : "Next Question")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.black)
                        .frame(width: 150, height: 40)

                }.buttonStyle(NeumorphismButtonStyle())

            }
            
        }
    }
    
    func saveGame(category: String){
        
        viewModel.gameToSave(category: category)
        
        modelContext.insert(viewModel.currentGame)

        
        withAnimation {
            viewModel.gameEnded.toggle()
        }
    }
    
}

    
#Preview {
    AnswerView(viewModel: ViewModel(), dataController: DataController())
}
