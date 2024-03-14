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
                Color.offWhite.ignoresSafeArea()
                
                VStack(spacing: 10) {
                    Text("Question \(dataController.numberOfQuestions - dataController.questions.count + 1)/\(dataController.numberOfQuestions)")
                        .font(.title)
                        .padding(0)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .font(.title)
                        .fontWeight(.black)
                        .padding(20)
                        .frame(width: 300, height: 60)
                        .modifier(InnerNeumorphismModifier())
                        .padding(.top,40)
                    Text(dataController.questions.first?.question.replaceQuotes() ?? "")

                        .padding(.horizontal)
                        .font(.title2)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(20)
                        .frame(width: 300,alignment: .topLeading)
                        .modifier(InnerNeumorphismModifier())
                        
                    
                    
                    VStack {
                        HStack  {
                            PlayerName(name: "True", isOn: .constant(true))
                            
                            PlayerName(name: "False", isOn: .constant(false))
                            
                        }
                        .frame(width: 300, height: 60)
                        .modifier(InnerNeumorphismModifier())
                        
                        Spacer()
                        
                        
                        HStack(spacing: 20) {
                            
                            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                                
                                ForEach(viewModel.players, id: \.id) { player in
                                    PlayerName(name: player.name, isOn:Binding(
                                        get: { player.answer! },
                                        set: {
                                            player.answer! = $0

                                            if $0 == true {
                                                player.answer! = false
                                            }
                                        }
                                    ))
                                    .onTapGesture {
                                        player.answer?.toggle()
                                    }
                                    .padding(.horizontal,10)
                                    .modifier(NeumorphismModifier())
                                    
                                    
                                   
                                }
                            }
                        }/*.padding(20)*/
                       
                        
                        
                        VStack{
                            Button(action: {
                              
                                viewModel.currentQuestion = dataController.questions.first
                                viewModel.checkAnswer()
                                
                                
                            }) {
                                Text("Submit")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color.black)
                                    .frame(width: 150, height: 40)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.offWhite)
                                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                    )
                            }.buttonStyle(NeumorphismButtonStyle())
                                .padding(30)
                            
                        
                        }
                    }
                    
                }
                
            }
            }
        }







#Preview {
    QuestionView(viewModel: ViewModel(), dataController: DataController())
}

struct PlayerName: View {
    var name: String
    @Binding var isOn: Bool
    
    var body: some View {
        
        HStack(spacing: 10) {
            Text(name)
                
                .fontWeight(.bold)
                .lineLimit(1)
                .frame(width: 100)
            Circle()
                .fill(.clear)
                .frame(width: 30, height: 30)
                .background(
                    ColorfulBackground(isHighlighted: isOn, shape: Circle())
                )
                
        }.frame(height: 60)
        
    }
}
