//
//  PlayerSetupView.swift
//  QuizGruppuppgift
//
//  Created by Joakim.Bjärkstedt on 2024-02-29.
//

import SwiftUI

struct PlayerSetupView: View {
    
    
    @Binding var amountOfPlayers: Int
    @Binding var amountOfQuestions: Int
    @Binding var selectionDifficulty: String
    @Binding var selectionCategory: String
    
    
//    @State private var playerNames: [String] = Array(repeating: "", count: 10) // Initiera med tomma strängar
    @ObservedObject var viewModel : ViewModel
    @ObservedObject var dataController : DataController
    @State var header: String = "Player Setup"
    
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
                    ForEach(0..<amountOfPlayers, id: \.self) { index in
                        TextField("Spelare \(index + 1)", text: Binding(
                                get: {
                                    if index < viewModel.players.count {
                                        return viewModel.players[index].name
                                    } else {
                                        return ""
                                    }
                                },
                                set: { newValue in
                                    if index < viewModel.players.count {
                                        viewModel.players[index].name = newValue
                                    } else {
                                        viewModel.players.append(Player(name: newValue, score: 0, answer: false))
                                    }
                                }
                            ))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.offwhite)
                                    .shadow(color: Color.black.opacity(1.0), radius: 5, x: 0, y: 2)
                            )
                    }
                }
                VStack {
                    
                    Text("Difficulty:")
                        .font(.system(size: 20, weight: .bold))
                        .accentColor(.black)
                    
                        .padding(5)
                    
                    
                    Text("\(selectionDifficulty)")
                        .font(.system(size: 18, weight: .bold))
                    
                    
                    
                    Text("Amount of questions")
                        .font(.system(size: 20, weight: .bold))
                        .accentColor(.black)
                    
                        .padding(5)
                    
                    Text("\(amountOfQuestions)")
                        .font(.system(size: 18, weight: .bold))
                    
                    Text("Category")
                        .font(.system(size: 20, weight: .bold))
                        .accentColor(.black)
                        .frame(width: 100, height: 15)
                    
                        .padding(5)
                    Text("\(selectionCategory)")
                        .font(.system(size: 18, weight: .bold))
                    
                }
                
                HStack{
                    Button {
                        viewModel.showQuestionView = true
                        viewModel.showFinishView = false
                        viewModel.playerSetUpView = false
                        viewModel.showAnswerView = false
                    } label: {
                        Text("Submit")
      
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
                        Text("Back")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.black)
                        .frame(width: 150, height: 40)
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.offwhite)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                                )                    }
                
            
                            
    
                           
                }
                .onAppear {
                    print(dataController.categorySelection)
                    
                    dataController.fetchQuestions(category: dataController.categorySelection, difficulty: dataController.difficultySelection, amountQuestions: dataController.numberOfQuestions) { questions in
                                    if let questions = questions {
                                        // Successfully fetched questions
                                        print("Fetched \(questions.count) questions")
                                        for question in questions {
                                            print("Question: \(question.question), Answer: \(question.answer)")
                                        }
                                    } else {
                                        // Error occurred while fetching questions
                                        print("Failed to fetch questions")
                                    }
                                }
                            }
            }
        }
                       
        }
  
   
    
    }
#Preview {

    PlayerSetupView(amountOfPlayers: .constant(5),amountOfQuestions: .constant(10), selectionDifficulty: .constant(("easy")), selectionCategory: .constant("sport"), viewModel: ViewModel(),dataController: DataController())

}





