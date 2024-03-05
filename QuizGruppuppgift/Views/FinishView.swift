//
//  FinishView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import SwiftUI
import SwiftData

struct FinishView: View {
    
    @Bindable var game: Game
    
    var body: some View {
        VStack{
            VStack{
                Text(game.date.extractDate(to: .date))
                    .font(.title)
                    .fontWeight(.black)
                HStack {
                    Text(game.date.extractDate(to: .hour))
                        .font(.headline)
                    .fontWeight(.black)
                    Text(game.category)
                        .font(.headline)
                        .fontWeight(.black)
                }
                
                   
            }.padding(.vertical)
            ForEach(game.players) { player in
                Spacer(minLength: 0)
                HStack{
                    Text(player.name)
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(player.score)")
                        .fontWeight(.bold)
                    
                }.frame(width: 250, height: 35)
                Spacer(minLength: 0)
            }
            
            Spacer()
                
        }.frame(width: 337.5, height: 540)
            .background(Color.green)
    }
    
    
}



#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Game.self, Player.self,migrationPlan: nil, configurations: config)
        let example: Game = Game(date: Date(), players: [])
        return FinishView( game: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
    

