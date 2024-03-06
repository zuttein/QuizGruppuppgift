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
    
    @State var selectionCategory = ""
   // @State var selectionNumberOfPlayers = 1
    @State var selectionDifficulty = ""
    
    @State var playerViewIsPresented = false
    @State var scoreboardViewIsPresented = false

    var body: some View {
        NavigationView {
            ZStack{
                Color.offwhite
                    .ignoresSafeArea()
                
                VStack {
                    Text("Hot potato")
                        .font(.title)
                    Image("Potatis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300,height: 300)
                    
                    
                    Spacer()
                    
                    Text("Choose category")
                        .font(.headline)
                    Picker("Kategori", selection: $selectionCategory){
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
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2))
                    
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
                    Picker("Svårhetsgrad", selection: $dataController.difficultySelection) {
                        ForEach(dataController.difficulty, id: \.self) { difficulty in
                            Text(difficulty)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                        .font(.system(size: 16, weight: .bold))
                        .accentColor(.black)
                        .frame(height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.offwhite)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        )
                    Spacer()
                    
                    
                    
                    HStack{
                        Button(action: {
                            print("pressed")
                            dataController.fetchQuestions(category: selectionCategory, difficulty: selectionDifficulty, amountQuestions: dataController.numberOfQuestions) { questions in
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
                            
                            /*Task {
                             await dataController.fetchData(url: <#String#>)
                             print("data hämtad")
                             }*/
                            
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


                        /*Task {
                            await dataController.fetchData(url: <#String#>)
                            print("data hämtad")
                        }*/
                       
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
                .sheet(isPresented: $playerViewIsPresented){
                    PlayerSetupView(amountOfPlayers: $viewModel.selectionNumberOfPlayers,selectionCategory: $selectionCategory)
                }
                    
                    Button(action: {
                        for question in dataController.questions {
                            print(question.question)

                        }
                        
                        Button(action: {
                            scoreboardViewIsPresented = true
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
                }
                
            }
            .padding(.horizontal, 30)
            .sheet(isPresented: $scoreboardViewIsPresented) {
                ScoreboardView(/* Pass necessary data to HighscoreView */)
                
            }
            
        }
    }
}

#Preview {
    StartView()
}


