//
//  ScoreboardView.swift
//  QuizGruppuppgift
//
//  Created by Katja Klahr on 2024-02-27.
//

import SwiftUI
import SwiftData

struct ScoreboardView: View {
    @ObservedObject var viewModel = ViewModel()
    @Query var games: [Game]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(games) { game in
                    VStack(alignment: .leading) {
                        Text("\(game.date)")
                        Text("Number of players that participated\(game.players.count)")
                    }
                }
            }
        }
    }
}

#Preview {
    ScoreboardView()
}
