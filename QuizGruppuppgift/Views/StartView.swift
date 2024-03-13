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
                Color.offWhite
                    .ignoresSafeArea()

                VStack(spacing:15) {
                    GifReaderView(gifName: "hotpotato_1")
                        .scaledToFit()
                        .padding(.top,30)
                    
                        .modifier(InnerNeumorphismModifier())
                        .padding(5)
                        .modifier(NeumorphismModifier())
                        
                    
                
                    VStack{
                        Text("Amount of questions \(dataController.numberOfQuestions)")
                        
                            .font(.headline)
                            .frame(width: 300, height: 40)
                            .modifier(InnerNeumorphismModifier())
                        Slider(value: Binding<Double>(
                            get: { Double(dataController.numberOfQuestions) },
                            set: { dataController.numberOfQuestions = Int($0) }
                        ),
                               in: 1...10,
                               step: 1
                        )
                    }
                    .padding(5)
                    .modifier(NeumorphismModifier())
                    
                    HStack{
                        Text("Choose category")
                            .font(.headline)
                            .frame(width: 200, height: 40)
                        
                            .modifier(InnerNeumorphismModifier())
                            .offset(x:8)
                        Spacer()
                        Picker("Category", selection: $dataController.categorySelection) {
                            ForEach(dataController.category, id: \.self) { category in
                                Text(category)
                            }
                        }
                        .font(.system(size: 16, weight: .bold))
                        .accentColor(.black)
                        .pickerStyle(MenuPickerStyle())
                    }
                    .padding(10)
                    .modifier(NeumorphismModifier())
                    
                    VStack{
                        Text("Number of Players \(viewModel.selectionNumberOfPlayers)")
                            .font(.headline)
                            .frame(width: 300, height: 40)
                            .modifier(InnerNeumorphismModifier())
                        Stepper("Add players", value: $viewModel.selectionNumberOfPlayers, in: 1...10)
                            .font(.system(size: 16, weight: .bold))
                            .accentColor(.black)
                            .frame(height: 40)
                            
                    }
                    .padding(15)
                    .modifier(NeumorphismModifier())
                    
                    VStack{
                        Text("Choose Difficulty")
                            .font(.headline)
                            .frame(width: 300, height: 40)
                            .modifier(InnerNeumorphismModifier())
                        Picker("Difficulty", selection: $dataController.difficultySelection) {
                            ForEach(dataController.difficulty, id: \.self) { difficulty in
                                Text(difficulty)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .font(.system(size: 16, weight: .bold))
                        .accentColor(.black)
                        .frame(height: 40)
                        
                    }
                    .padding(10)
                    .modifier(NeumorphismModifier())
                    
                    Spacer()
                    
                    
                    HStack(spacing:30) {
                        NavigationLink(destination: GameView(viewModel: viewModel, dataController: dataController)
                            .navigationBarBackButtonHidden(true)
                            
                        ) {
                            Text("Continue")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color.black)
                                .frame(width: 150, height: 40)
                                
                        }
                        .navigationBarBackButtonHidden(true)
                        .buttonStyle(NeumorphismButtonStyle())
                        
                            
                            NavigationLink(destination: ScoreboardView()
                                .navigationBarBackButtonHidden(true)
                            ) {
                                Text("Scoreboard")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color.black)
                                    .frame(width: 150, height: 40)
                                    .modifier(NeumorphismModifier())
                            }
                            .buttonStyle(NeumorphismButtonStyle())
                        }

                        
                    }

            }
            .padding(.horizontal, 30)  
            .background(Color.offWhite)
                
            }
    }
        }


#Preview {
    StartView()
}


