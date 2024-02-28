//
//  viewModel.swift
//  QuizGruppuppgift
//
//  Created by Katja Klahr on 2024-02-27.
//

import Foundation
import CoreData

class ViewModel: ObservableObject {
    
    @Published var gameScores: [GameScore] = []
    @Published var game: [Game] = []
    var container = Persistence.shared.container
    
    init() {
        self.getScoreboard()
        self.getGameplay()
    }
    
    func getScoreboard() {
        let request = NSFetchRequest<GameScore>(entityName: "GameScore")
        do {
            gameScores = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching game scores: \(error)")
        }
    }
    
    func getGameplay(){
        let request = NSFetchRequest<Game>(entityName: "Game")
        do {
            game = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching game scores: \(error)")
        }
        
    }
    
    
    
}
