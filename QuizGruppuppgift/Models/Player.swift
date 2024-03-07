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
    var answer: Bool?
    
    
    init(id: UUID = UUID(), name: String, score: Int, answer: Bool) {
        self.id = id
        self.name = name
        self.score = score
        self.answer = answer
    }
}
