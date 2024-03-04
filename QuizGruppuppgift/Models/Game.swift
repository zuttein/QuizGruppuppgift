//
//  Game.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import Foundation
import SwiftData

@Model
class Game {
    var id: UUID
    var date: Date
    var players: [Player]
    //var category: String
    
    init(id: UUID = UUID(), date: Date, players: [Player] ) {
        self.id = id
        self.date = date
        self.players = players
        
    }
}
