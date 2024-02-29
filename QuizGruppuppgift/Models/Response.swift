//
//  Response.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-28.
//

import Foundation

struct Response: Codable {
    let response_code : Int
    let results : [Question]
}
