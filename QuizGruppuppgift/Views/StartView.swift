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

    @State var scoreboardViewIsPresented = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.offwhite
                    .ignoresSafeArea()

                VStack {
                    //                    GifReaderView(gifName: "hotpotatologo")
                    //                        .scaledToFit()
                    
                    
                    
                    
                    Text("Amount of questions \(dataController.numberOfQuestions)")
                    
                        .font(.headline)
                    
                    Slider(value: Binding<Double>(
                        get: { Double(dataController.numberOfQuestions) },
                        set: { dataController.numberOfQuestions = Int($0) }
                    ),
                           in: 1...50,
                           step: 1
                    )
                    
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
                        NavigationLink(destination: PlayerSetupView(amountOfPlayers: $viewModel.selectionNumberOfPlayers, amountOfQuestions: $dataController.numberOfQuestions, selectionDifficulty: $dataController.difficultySelection, selectionCategory: $dataController.categorySelection)
                            .navigationBarBackButtonHidden(true)
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
                        ) {
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
                        .navigationBarBackButtonHidden(true)
                            
                            NavigationLink(destination: ScoreboardView()
                                .navigationBarBackButtonHidden(true)
                            ) {
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

                        
                    }

            }
            .padding(.horizontal, 30)  
            .background(Color.offwhite)
                
            }
    }
        }


#Preview {
    StartView()
}


