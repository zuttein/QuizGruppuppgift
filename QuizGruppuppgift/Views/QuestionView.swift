//
//  QuestionView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import SwiftUI

struct QuestionView: View {
    @ObservedObject var viewModel = ViewModel()
    @Binding var showQuestionView: Bool
    @Binding var showAnswerView: Bool
    
    @State var numbersOfQuestion: String = "Question 1/10"
    @State var Question: String = "Is Stockholm the capital city of Sweden"
    
    
    //Dummie för playerdata
    let players: [Player] = [
        Player(name: "Kevin", score: 0),
        Player(name: "Dennis", score: 0),
        Player(name: "Joakim", score: 0),
        Player(name: "Katja", score: 0),
        Player(name: "Genti", score: 0),
        Player(name: "Janne", score: 0),
        Player(name: "Pelle", score: 0),
        Player(name: "Lisa", score: 0),
        Player(name: "Kalle", score: 0),
        Player(name: "Gregor", score: 0)
    ]
    
    var body: some View {
        ZStack {
            Color(.offwhite).ignoresSafeArea()
            
            VStack(spacing: 10) {
                Text(numbersOfQuestion)
                    .font(.title)
                    .padding(0)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                Text(Question)
                    .padding(.horizontal)
                    .font(.title2)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                VStack {
                    HStack  {
                        Text("TRUE")
                            .padding(10)
                            .fontWeight(.bold)
                            .font(.title2)
                            .multilineTextAlignment(.leading)
                        Circle()
                            .fill(viewModel.selectedAnswer == true ? .green : .black)
                            .frame(width: 25, height: 25)
                            .onTapGesture {
                                viewModel.selectedAnswer = true
                                viewModel.updateSelectedPlayerColor()
                            }
                        
                        Text("FALSE")
                            .padding()
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        
                        Circle()
                            .fill(viewModel.selectedAnswer == false ? .red : .black)
                            .frame(width: 25, height: 25)
                            .onTapGesture {
                                viewModel.selectedAnswer = false
                                viewModel.updateSelectedPlayerColor()
                            }
                        
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.offwhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    )
                    .padding(.bottom, 50)
                    
                
                    
                    HStack(spacing: 20) {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                            ForEach(players, id: \.id) { player in
                                HStack {
                                    Circle()
                                        .fill(viewModel.playerColors[player.id] ?? .black)
                                        .frame(width: 25, height: 25)
                                        .onTapGesture {
                                            viewModel.selectedPlayer = player
                                            viewModel.updateSelectedPlayerColor()
                                        }
                                    
                                    Text(player.name)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.offwhite)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        )

                        
                        VStack{
                            Button(action: {
                                showAnswerView = true
                                showQuestionView = false
                                
                                //Logik för att rätta svar och dela ut poäng läggs till här
                                
                            }) {
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
                                
                                //Vad ska denna knapp göra?
                               
                            }) {
                                Text("Cancel")
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
    }

}





//#Preview {
//   QuestionView()
//}
