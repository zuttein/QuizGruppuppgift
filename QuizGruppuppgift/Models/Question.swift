//
//  Question.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-28.
//

import Foundation

struct Question : Codable {
    let question : String
    let answer : String
    
    enum CodingKeys: String, CodingKey {
        case question
        case answer = "correct_answer"
    }
}
