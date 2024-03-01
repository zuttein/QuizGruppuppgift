//
//  QuizGruppuppgiftApp.swift
//  QuizGruppuppgift
//
//  Created by Dennis.Nilsson on 2024-02-26.
//

import SwiftUI
import SwiftData

@main
struct QuizGruppuppgiftApp: App {
    var body: some Scene {
        WindowGroup {
            StartView()
                
        }.modelContainer(for: Game.self)
        .modelContainer(for: Player.self)
    }
}
