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
    @ObservedObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        ZStack {
            Color.offWhite.ignoresSafeArea()
            VStack{
                FinishCard(game: game)
                    .frame(width: 337.5, height: 540)
                        
                        .padding(.top, 50)
                HStack(spacing: 50) {
                    NavigationLink(destination: StartView()
                        .navigationBarBackButtonHidden(true))
                    {
                        Text("Done ")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color.black)
                            .padding(20)
                            
                            .modifier(NeumorphismModifier())
                }
                    Button {
                        viewModel.checkPermition(photoToBeSaved: FinishCard(game: game))
                    } label: {
                        Text("Share")
                            .padding(20)
                            .modifier(NeumorphismModifier())
                    }

                }.padding(.vertical, 50)
            }
        }
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
    


struct FinishCard: View {
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
            ForEach(game.players, id:\.id) { player in
                Spacer(minLength: 0)
                HStack{
                    Text(player.name)
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(player.score)")
                        .fontWeight(.bold)
                    
                }
                
                .frame(height: 35)
                Spacer(minLength: 0)
            }.padding(.horizontal,30)
            
            Spacer()
            
        }
        .frame(width:UIScreen.main.bounds.width-20,height: UIScreen.main.bounds.height-300)
        .modifier(InnerNeumorphismModifier())
    }
}
