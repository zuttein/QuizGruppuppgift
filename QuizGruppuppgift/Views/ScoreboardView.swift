//
//  ScoreboardView.swift
//  QuizGruppuppgift
//
//  Created by Katja Klahr on 2024-02-27.
//

import SwiftUI
import SwiftData


/*
struct ScoreboardView: View {
    
    
    @Query var games: [Game]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(games) { game in
                    NavigationLink {
                        FinishView(game: game)
                    } label: {
                        VStack(alignment: .leading){
                            Text(game.date.extractDate(to: .date)
                                 + " "
                                 + game.date.extractDate(to: .hour))
                                .fontWeight(.black)
                            HStack {
                                Text("Participants: \(game.players.count)")
                                    .font(.subheadline)
                                Text("Winner: \(game.players.first?.name ?? "")")
                                    .font(.headline)
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScoreboardView()
}

*/

struct ScoreboardView: View {
    @Environment(\.presentationMode) var presentationMode
    @Query var games: [Game]
    @Environment(\.modelContext) var modelContext

    
    var body: some View {
        ZStack{
            Color.offwhite
                .ignoresSafeArea()
            
            VStack {
                Text("Results")
                    .font(.title)
                
                List {
                    ForEach(games) { game in
                        VStack(alignment: .leading) {
                            Text("Timestamp: \(game.date.extractDate(to: .dateAndHour))")
                            Text("Category:)")
                            
                            ForEach(game.players, id: \.self) { player in
                                Text("Player Name: \(player.name) - Score: \(player.score)")
                            }
                        }.swipeActions {
                            Button("Delete", systemImage: "trash", role: .destructive) {
                                modelContext.delete(game)
                            }
                        }
                    }
                }
                
                Spacer()
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Back")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color.black)
                            .frame(width: 150, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.offwhite)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            )
                    }
                    Button(action: {
                        deleteAll()
                    }) {
                        Text("Clear Scoreboard")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color.black)
                            .frame(width: 150, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.offwhite)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            )
                    }
                }
                
            }
            
        }
    }
    func deleteAll(){
        for game in games {
            modelContext.delete(game)
        }
    }
}

#Preview {
    ScoreboardView()
}
