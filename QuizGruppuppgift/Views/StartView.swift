//
//  ContentView.swift
//  QuizGruppuppgift
//
//  Created by Dennis.Nilsson on 2024-02-26.
//

import SwiftUI

struct StartView: View {
    
    @ObservedObject var dataController = DataController()
    @ObservedObject var viewModel = ViewModel()
    
//    @State var selectionCategory = ""
    @State var selectionDifficulty = ""
    
    @State var playerViewIsPresented = false
    @State var scoreboardViewIsPresented = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.offwhite
                    .ignoresSafeArea()

                VStack {
                    
                    Text("Hot potato")
                        .font(.title)
                    Image("Potatis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    
                    

                    Text("Antal Frågor \(dataController.numberOfQuestions)")
                        .font(.headline)

                    Slider(value: Binding<Double>(
                                get: { Double(dataController.numberOfQuestions) },
                                set: { dataController.numberOfQuestions = Int($0) }
                            ),
                            in: 1...100,
                            step: 1
                        )

//                    Text("Välj Svårhetsgrad")
//                        .font(.headline)
//                    Picker("Svårhetsgrad", selection: $dataController.difficultySelection) {
//                        ForEach(dataController.difficulty, id: \.self) { difficulty in
//                            Text(difficulty)
//                        }
//                    }
                    
    
            
                        Text("Choose category")
                            .font(.headline)
                    Picker("Category", selection: $dataController.categorySelection) {
                            ForEach(dataController.category, id: \.self) { category in
                                Text(category)
                            }
                        }
                        .font(.system(size: 16, weight: .bold))
                        .accentColor(.black)
                        .pickerStyle(MenuPickerStyle())
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.offwhite)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        )

                        Text("Number of Players \(viewModel.selectionNumberOfPlayers)")
                            .font(.headline)
                        Stepper("Add players", value: $viewModel.selectionNumberOfPlayers, in: 1...10)
                            .font(.system(size: 16, weight: .bold))
                            .accentColor(.black)
                            .frame(height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.offwhite)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            )

                        Text("Choose Difficulty")
                            .font(.headline)
                        Picker("Difficulty", selection: $dataController.difficultySelection) {
                            ForEach(dataController.difficulty, id: \.self) { difficulty in
                                Text(difficulty)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .font(.system(size: 16, weight: .bold))
                        .accentColor(.black)
                        .frame(height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.offwhite)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        )
                        
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                print("pressed")
                                dataController.fetchQuestions(category: dataController.categorySelection, difficulty: selectionDifficulty, amountQuestions: dataController.numberOfQuestions) { questions in
                                    if let questions = questions {
                                        // Successfully fetched questions
                                        print("Fetched \(questions.count) questions")
                                        for question in questions {
                                            print("Question: \(question.question), Answer: \(question.answer)")
                                        }
                                        playerViewIsPresented.toggle()
                                    } else {
                                        // Error occurred while fetching questions
                                        print("Failed to fetch questions")
                                    }
                                }
                            }) {
                                Text("Continue")
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
                                scoreboardViewIsPresented.toggle()
                            }) {
                                Text("Scoreboard")
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

                        .sheet(isPresented: $playerViewIsPresented) {
                            PlayerSetupView(amountOfPlayers: $viewModel.selectionNumberOfPlayers,
                                            amountOfQuestions: $dataController.numberOfQuestions, difficulty:$selectionDifficulty, selectionCategory: $dataController.categorySelection)
                        }
                        
                        
                        .sheet(isPresented: $scoreboardViewIsPresented) {
                            ScoreboardView()
                    }
                }
            }
            .padding(.horizontal, 30)   
                
            }
            
        }
    }

#Preview {
    StartView()
}


