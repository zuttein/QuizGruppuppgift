//
//  ContentView.swift
//  QuizGruppuppgift
//
//  Created by Dennis.Nilsson on 2024-02-26.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var dataController = DataController()
    @ObservedObject var viewModel = ViewModel()
    
    @State var selectionCategory = ""
    @State var selectionNumberOfPlayers = 1
    @State var selectionDifficulty = ""
    
    
    var body: some View {
        ZStack{
            Color.offwhite
                .ignoresSafeArea()
            
            VStack {
                Text("Coolt namn")
                    .font(.title)
                Image("Potatis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300,height: 300)
                    
                
                Spacer()
                
                Text("Välj Kategori")
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
                
                
                
                Text("Antal Spelare \(selectionNumberOfPlayers)")
                    .font(.headline)
                Stepper("Add players", value: $selectionNumberOfPlayers, in: 1...10)
                .font(.system(size: 16, weight: .bold))
                .accentColor(.black)
                .frame(height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.offwhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                )
                
                Text("Välj Svårhetsgrad")
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
                        Task {
                            await dataController.fetchData()
                            print("data hämtad")
                        }
                       
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
                    
                    Button(action: {
                        for question in dataController.questions {
                            print(question.question)
                        }
                    }) {
                        Text("Highscore")
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
        
        
    }
}

#Preview {
    ContentView()
}
