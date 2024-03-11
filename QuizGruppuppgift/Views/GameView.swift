//
//  GameView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import SwiftUI

struct GameView: View {
    @Environment(\.modelContext) var modelContext
    
    @ObservedObject var viewModel : ViewModel
    @ObservedObject var dataController : DataController
    
    var body: some View {
        if viewModel.playerSetUpView {
            PlayerSetupView(amountOfPlayers: $viewModel.selectionNumberOfPlayers, amountOfQuestions: $dataController.numberOfQuestions, selectionDifficulty: $dataController.difficultySelection, selectionCategory: $dataController.categorySelection,viewModel: viewModel,dataController: dataController)
        }
        if viewModel.showQuestionView {
            QuestionView(viewModel: viewModel, dataController: dataController)
        } else if viewModel.showAnswerView {
            AnswerView(onSaveGame: saveGame, viewModel: viewModel, dataController: dataController)
        } else if viewModel.showFinishView {
            FinishView(game: viewModel.currentGame)
        }
    }
    
    // only when game ends...
    func saveGame(){
        viewModel.gameToSave()
        modelContext.insert(viewModel.currentGame)
        sleep(2)
        withAnimation {
            viewModel.gameEnded.toggle()
        }
    }
}

#Preview {
    GameView(viewModel: ViewModel(), dataController: DataController())
}
