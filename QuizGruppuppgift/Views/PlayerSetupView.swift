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
            Color.offwhite
                .ignoresSafeArea()
            VStack{
                Text(header)
                    .font(.title)
                    .padding(0)
                
                List{
                    ForEach(0..<amountOfPlayers, id: \.self) { index in
                        TextField("Player \(index + 1)", text: Binding(
                                get: {
                                    if index < viewModel.players.count {
                                        return viewModel.players[index].name
                                    } else {
                                        return "Player \(index)"
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
                        viewModel.showQuestionV()
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
                    
                    NavigationLink(destination: StartView()) {
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
                .task {
                    await dataController.fetchData()
                    
                }
                
            }
        }
                       
        }
  
   
    
    }
#Preview {

    PlayerSetupView(amountOfPlayers: .constant(5),amountOfQuestions: .constant(10), selectionDifficulty: .constant(("easy")), selectionCategory: .constant("sport"), viewModel: ViewModel(),dataController: DataController())

}





