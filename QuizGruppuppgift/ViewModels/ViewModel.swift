//
//  viewModel.swift
//  QuizGruppuppgift
//
//  Created by Katja Klahr on 2024-02-27.
//

import Foundation
import CoreData
import SwiftUI

class ViewModel: ObservableObject {
    
    
    @Published var playerSetUpView = true
    @Published var showQuestionView = false
    @Published var showAnswerView = false
    @Published var showFinishView = false
    
    
    @Published var players: [Player] = []
    @Published var selectionNumberOfPlayers = 1
    @Published var currentQuestion: Question?
    
    @Published var currentGame: Game = Game(date: Date(), players: [])
    
    @Published var gameEnded = false
    
    var maxScore: Int {
            // Calculate the maximum achievable score based on your quiz setup
            // Replace this with your logic
            return 50 // Example value, replace it with your actual max score
        }
    

   
    
    func gameToSave() {
        
        currentGame = Game(date: Date(), players: [], category: "Any Category")
        
        currentGame.players.append(contentsOf: players)
        
        print(currentGame)
        
    }
    
    func createGame(players: [Player]) {
            // Skapa ett nytt Game-objekt med angivna spelare och spara det i currentGame
            currentGame = Game(date: Date(), players: players)
        }
    
    
    func addPlayer(name: String) {
        currentGame.players.append(Player(name: name, score: 0, answer: true))
    }
    
    func checkAnswer(){
        for player in players {
            if player.answer == currentQuestion?.answer {
                player.score += 1
            }
            player.answer = true
        }
        
        
        getNextQuestion()
        showAnswerView.toggle()
        showQuestionView.toggle()
    }
    
    
    func getNextQuestion(){
       
    
        
        /*guard dataController.questions.isEmpty else {
            showFinishView()
            return
        }*/
        
        
        
    }
    
}
