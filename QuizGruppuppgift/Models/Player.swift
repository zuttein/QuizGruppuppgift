//
//  Player.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import Foundation
import SwiftData

@Model
class Player {
    var id: UUID
    var name: String
    var score: Int
    
    
    init(id: UUID = UUID(), name: String, score: Int) {
        self.id = id
        self.name = name
        self.score = score
    }
}
