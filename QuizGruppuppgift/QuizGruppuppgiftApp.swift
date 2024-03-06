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
    
    let container:ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: Game.self, Player.self, migrationPlan: nil)
        } catch {
            fatalError("Failed to initialize modelcontainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
//            StartView()
//            ScoreboardView()
  GameView()
                
        }.modelContainer(container)
        
    }
}
