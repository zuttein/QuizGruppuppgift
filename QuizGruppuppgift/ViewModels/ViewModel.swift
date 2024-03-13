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
    

   
    
    func gameToSave(category: String) {
        
        currentGame = Game(date: Date(), players: [], category: category)
        
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
    
    func addPlayers(number: Int) {
        for index in 0..<number {
            addPlayer(name: "Player \(index + 1)")
        }
    }
    
    func checkAnswer(){
        for player in players {
            if player.answer == (currentQuestion!.answer.lowercased() == "true") {
                player.score += 1
            }
            player.answer = true
        }
        
        
        getNextQuestion()
        showAnswerV()
        
    }
    
    
    func getNextQuestion(){
       
    
        
        /*guard dataController.questions.isEmpty else {
            showFinishView()
            return
        }*/
        
        
        
    }
    
    func showSetUpPlayerV() {
        playerSetUpView = true
        showQuestionView = false
        showAnswerView = false
        showFinishView = false
    }
    
    func showQuestionV(){
        playerSetUpView = false
        showQuestionView = true
        showAnswerView = false
        showFinishView = false
    }
    
    func showAnswerV(){
        playerSetUpView = false
        showQuestionView = false
        showAnswerView = true
        showFinishView = false
    }
    
    func showFinishV(){
        playerSetUpView = false
        showQuestionView = false
        showAnswerView = false
        showFinishView = true
    }
    
}
