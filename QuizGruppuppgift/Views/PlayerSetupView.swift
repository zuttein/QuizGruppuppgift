//
//  PlayerSetupView.swift
//  QuizGruppuppgift
//
//  Created by Joakim.Bjärkstedt on 2024-02-29.
//

import SwiftUI

struct PlayerSetupView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var amountOfPlayers: Int
    @Binding var amountOfQuestions: Int
    @Binding var selectionDifficulty: String
    @Binding var selectionCategory: String
    
    @State var startViewIsPresented = false

    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var dataController = DataController()
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
                        TextField("Player \(index + 1)", text: .constant(""))
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
                    NavigationLink(destination: GameView()
                        .onTapGesture {
                            print(DataController.shared.questions)
                        }
                        .navigationBarBackButtonHidden(true))
                    {
                        Text("Start Game")
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
                        presentationMode.wrappedValue.dismiss()
                    })
                            {
                                                
                            Text("Back")
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
#Preview {

    PlayerSetupView(amountOfPlayers: .constant(5),amountOfQuestions: .constant(10), selectionDifficulty: .constant(("easy")), selectionCategory: .constant("sport"))

}





