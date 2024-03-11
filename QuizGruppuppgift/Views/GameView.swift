//
//  GameView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel : ViewModel
    @ObservedObject var dataController : DataController
    
    var body: some View {
        if viewModel.playerSetUpView {
            PlayerSetupView(amountOfPlayers: $viewModel.selectionNumberOfPlayers, amountOfQuestions: $dataController.numberOfQuestions, selectionDifficulty: $dataController.difficultySelection, selectionCategory: $dataController.categorySelection,viewModel: viewModel,dataController: dataController)
        }
        if viewModel.showQuestionView {
            QuestionView(viewModel: viewModel, dataController: dataController)
        } else if viewModel.showAnswerView {
            AnswerView(viewModel: viewModel, dataController: dataController)
        } else if viewModel.showFinishView {
            FinishView(game: viewModel.currentGame)
        }
    }
    
    // only when game ends...
    
}

#Preview {
    GameView(viewModel: ViewModel(), dataController: DataController())
}
