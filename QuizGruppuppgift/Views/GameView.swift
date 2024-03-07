//
//  GameView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import SwiftUI

struct GameView: View {
    @Environment(\.modelContext) var modelContext
    @ObservedObject var viewModel = ViewModel()
    
    @State var showQuestionView = true
    @State var showAnswerView = false
    
    var body: some View {
        NavigationStack {
            
            if showQuestionView {
                QuestionView(showQuestionView: $showQuestionView, showAnswerView: $showAnswerView)
            } else if showAnswerView {
                AnswerView(onSaveGame: saveGame, showQuestionView: $showQuestionView, showAnswerView: $showAnswerView)
            } else {
                FinishView(game: viewModel.currentGame)
            }
            
            
//                .toolbar{
//                    Button {
//                        saveGame()
//                        
//                        
//                    } label: {
//                        Image(systemName: "plus")
//                    }
//                }
           
            
        }
    }
    
    // only when game ends...
    func saveGame(){
        viewModel.gameToSave()
        modelContext.insert(viewModel.currentGame)
        sleep(UInt32(0.2))
        withAnimation {
            viewModel.gameEnded.toggle()
        }
    }
}

#Preview {
    GameView()
}
