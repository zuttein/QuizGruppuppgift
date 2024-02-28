//
//  Question.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-28.
//

import Foundation

struct Question : Codable {
    let category : String
    let type : String
    let difficulty : String
    let question : String
    let correct_answer : String
}
