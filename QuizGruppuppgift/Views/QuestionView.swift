//
//  QuestionView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import SwiftUI

    struct QuestionView: View {
        @ObservedObject var viewModel : ViewModel
        @ObservedObject var dataController : DataController
        
      
        
        @State var numbersOfQuestion: String = "Question 1/10"
        @State var Question: String = "Is Stockholm the capital city of Sweden"
        
        
        var body: some View {
            ZStack {
                Color(.offwhite).ignoresSafeArea()
                
                VStack(spacing: 10) {
                    Text("Question \(dataController.numberOfQuestions - dataController.questions.count)/\(dataController.numberOfQuestions)")
                        .font(.title)
                        .padding(0)
                        .frame(maxHeight: .infinity, alignment: .top)
                    
                    Text(dataController.questions.first?.question ?? "")
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
                                .fill(.green)
                                .frame(width: 25, height: 25)
                            
                            
                            Text("FALSE")
                                .padding()
                                .font(.title2)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            
                            Circle()
                                .fill(.red)
                                .frame(width: 25, height: 25)
                            
                            
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.offwhite)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        )
                        .padding(.bottom, 50)
                        
                        
                        
                        HStack(spacing: 20) {
                            
                            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                                
                                ForEach(viewModel.players, id: \.id) { player in
                                    VStack {
                                        Text(player.name)
                                            .multilineTextAlignment(.leading)
                                        Circle()
                                            .fill(player.answer! ? .green : .red)
                                            .frame(width: 25, height: 25)
                                        
                                       
                                    }.onTapGesture {
                                        player.answer?.toggle()
                                    }
                                    .padding(30)
                                    
                                   
                                }
                            }
                        }/*.padding(20)*/
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.offwhite)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        )
                        
                        
                        VStack{
                            Button(action: {
                                //showAnswerView = true
                                //showQuestionView = false
                                
                                //Logik för att rätta svar och dela ut poäng läggs till här
                                viewModel.currentQuestion = dataController.questions.first
                                viewModel.checkAnswer()
                                
                                
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







//#Preview {
//   QuestionView()
//}
