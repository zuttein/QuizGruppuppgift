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
    
    @FocusState var focus: Bool
    
    
    //    @State private var playerNames: [String] = Array(repeating: "", count: 10) // Initiera med tomma strängar
    @ObservedObject var viewModel : ViewModel
    @ObservedObject var dataController : DataController
    @State var header: String = "Player Setup"
    
    let maxPlayers = 10
    
    var body: some View {
        ZStack{
            Color.offWhite.ignoresSafeArea()
            if dataController.showProgressBar {
                
                VStack {
                    GifReaderView(gifName: "hotpotato_1")
                        .frame(width: 200,height: 200)
                    
                    Text("Game will start soon....")
                        .padding(10)
                }
                .padding(.top,30)
                .modifier(InnerNeumorphismModifier())
                .padding(5)
                .modifier(NeumorphismModifier())
            } else {
                ZStack{
                    
                    VStack{
                        Text(header)
                            .font(.title)
                            .fontWeight(.black)
                            .padding(20)
                            .frame(width: 300, height: 60)
                            .modifier(InnerNeumorphismModifier())
                            .padding(.top,40)
                        
                        List{
                            
                            ForEach(0..<amountOfPlayers, id: \.self) { index in
                                TextField("Player \(index + 1)", text: Binding(
                                    get: {
                                        if index < viewModel.players.count {
                                            return viewModel.players[index].name
                                        } else {
                                            return "Player \(index + 1)"
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
                                .padding(10)
                                
                                .modifier(InnerNeumorphismModifier())
                            
                                
                                
                                
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                        .listRowSpacing(-15)
                        
                        
                        VStack(spacing:11) {
                            
                            Text("Difficulty: \(selectionDifficulty.capitalized)")
                                .font(.system(size: 20, weight: .bold))
                                .accentColor(.black)
                            
                            
                            Text("Amount of questions: \(amountOfQuestions)")
                                .font(.system(size: 20, weight: .bold))
                                .accentColor(.black)
                            
                              
                            
                            Text("Category: \(selectionCategory.capitalized)")
                                .font(.system(size: 20, weight: .bold))
                                .accentColor(.black)
                                
                            
                        }
                        .padding(20)
                        .padding(.horizontal, 20)
                        .modifier(InnerNeumorphismModifier())
                        .padding(.bottom,30)
                        HStack(spacing:30){
                            Button {
                                viewModel.showQuestionV()
                            } label: {
                                Text("Submit")
                                
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color.black)
                                    .frame(width: 100, height: 40)
                                    
                            }
                            .buttonStyle(NeumorphismButtonStyle())
                            
                            NavigationLink(destination: StartView()) {
                                Text("Back")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color.black)
                                    .frame(width: 100, height: 40)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.offWhite)
                                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                    )}
                            
                            .buttonStyle(NeumorphismButtonStyle())
                            
                            
                            
                            
                            
                        }
                        
                        
                        
                    }
                }
            }
        }.task {
            await dataController.fetchData()
            
        }
        
    }
    
    
    
}
#Preview {
    
    PlayerSetupView(amountOfPlayers: .constant(5),amountOfQuestions: .constant(10), selectionDifficulty: .constant(("easy")), selectionCategory: .constant("sport"), viewModel: ViewModel(),dataController: DataController())
    
}





