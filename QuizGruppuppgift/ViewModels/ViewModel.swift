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
    @Published var selectedPlayer: Player? = nil
    @Published var playerColors: [UUID: Color] = [:]
    @Published var playerInfo: [String] = []

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
    
    
    func updateSelectedPlayerColor() {
        guard let player = selectedPlayer else { return }
        
        //Byter answer variablen mellan sant och falskt
        player.answer?.toggle()

        //Om answer är true eller nil så blir cirkeln vid spelaren grön, om den är falsk är den röd.
        if player.answer ?? true {
                playerColors[player.id] = .green
            } else {
                playerColors[player.id] = .red
            }
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
        
        for i in 0...10 {
            players.append(Player(name: "Player \(i)", score: i+Int.random(in: 0...10), answer: false))
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
    
    func createGame(players: [Player]) {
            // Skapa ett nytt Game-objekt med angivna spelare och spara det i currentGame
            currentGame = Game(date: Date(), players: players)
        }
    
    
    func addPlayer(name: String) {
        currentGame.players.append(Player(name: name, score: 0, answer: true))
        
        
    }
    func updateGame(){
        for player in playerInfo {
            addPlayer(name: player)
            
        }
    
    }
    func updatePlayerInfo(){
        for i in 0...selectionNumberOfPlayers{
            playerInfo.append("player \(i)")
        }
    }
}
