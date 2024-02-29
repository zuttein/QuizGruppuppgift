//
//  Game.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import Foundation

class Game {
    var date: Date
    var player: [Player]
    
    init(date: Date, player: [Player]) {
        self.date = date
        self.player = player
    }
}
