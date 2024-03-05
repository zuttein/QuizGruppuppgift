//
//  viewModel.swift
//  QuizGruppuppgift
//
//  Created by Katja Klahr on 2024-02-27.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var selectionNumberOfPlayers = 1
    @Published var currentGame: Game = Game(date: Date(), players: [])
    @Published var gameEnded = false
    @Published var colors: [Color] = []

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
        
        currentGame = Game(date: Date(), players: [], category: "Any Category")
        var players: [Player] = []
        // this is dummy add real players to append.
        
        for i in 0..<10 {
            players.append(Player(name: "Player \(i)", score: i+Int.random(in: 0...10)))
        }
        players.sort{
            $0.score >= $1.score
        }
        /*for player in players {
            print(player.name + "\(player.score)" )
        }*/
        currentGame.players.append(contentsOf: players)
        
        
        
        print(currentGame)
        
    }
    
    func generateRandomColors(count: Int) -> [Color] {
        for _ in 0..<count {
            let red = Double.random(in: 0..<1)
            let green = Double.random(in: 0..<1)
            let blue = Double.random(in: 0..<1)
            let color = Color(red: red, green: green, blue: blue)
            colors.append(color)
        }
        return colors
    }
    
    
}
