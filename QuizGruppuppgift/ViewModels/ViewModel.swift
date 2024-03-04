//
//  viewModel.swift
//  QuizGruppuppgift
//
//  Created by Katja Klahr on 2024-02-27.
//

import Foundation
import CoreData

class ViewModel: ObservableObject {
    
    @Published var selectionNumberOfPlayers = 1
    @Published var currentGame: Game = Game(date: Date(), players: [])
    @Published var gameEnded = false


    //@Published var gameScores: [GameScore] = []
    //@Published var game: [Game] = []
    
    
    init() {
        self.getScoreboard()
        self.getGameplay()
    }
    
    
    func getScoreboard() {
        /*
         let request = NSFetchRequest<GameScore>(entityName: "GameScore")
         do {
         gameScores = try container.viewContext.fetch(request)
         } catch let error {
         print("Error fetching game scores: \(error)")
         }*/
    }
    
    func getGameplay(){
        /*
         let request = NSFetchRequest<Game>(entityName: "Game")
         do {
         game = try container.viewContext.fetch(request)
         } catch let error {
         print("Error fetching game scores: \(error)")
         }*/
        
    }
    
    
    
    func gameToSave() {
        
        currentGame = Game(date: Date(), players: [])
        var players: [Player] = []
        // this is dummy add real players to append.
        
        for i in 0...10 {
            players.append(Player(name: "Player \(i)", score: i+Int.random(in: 0...10)))
        }
        
        currentGame.players.append(contentsOf: players)
        
        print(currentGame)
        
    }
    
    
    
}
