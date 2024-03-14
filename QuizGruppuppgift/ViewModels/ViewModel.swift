//
//  viewModel.swift
//  QuizGruppuppgift
//
//  Created by Katja Klahr on 2024-02-27.
//

import Foundation
import CoreData
import SwiftUI
import Photos


class ViewModel: ObservableObject {
    
    @Published var playerSetUpView = true
    @Published var showQuestionView = false
    @Published var showAnswerView = false
    @Published var showFinishView = false
    
    
    @Published var players: [Player] = []
    @Published var selectionNumberOfPlayers = 1
    @Published var currentQuestion: Question?
    
    @Published var currentGame: Game = Game(date: Date(), players: [])
    
    @Published var gameEnded = false
   
    
    func gameToSave(category: String) {
        
        currentGame = Game(date: Date(), players: [], category: category)
        
        currentGame.players.append(contentsOf: players)
        
        print(currentGame)
        
    }
    
    func createGame(players: [Player]) {
            // Skapa ett nytt Game-objekt med angivna spelare och spara det i currentGame
            currentGame = Game(date: Date(), players: players)
        }
    
    
    func addPlayer(name: String) {
        currentGame.players.append(Player(name: name, score: 0, answer: true))
    }
    
    func addPlayers(number: Int) {
        for index in 0..<number {
            addPlayer(name: "Player \(index + 1)")
        }
    }
    
    func checkAnswer(){
        for player in players {

            if player.answer == (currentQuestion!.answer.lowercased() == "true") {

                player.score += 1
            }
            player.answer = true
        }
        
        showAnswerV()
        
    }
    
    func showSetUpPlayerV() {
        playerSetUpView = true
        SoundManager.instance.playSound (sound: .swipe)

        showQuestionView = false
        showAnswerView = false
        showFinishView = false

    }
    
    func showQuestionV(){
        playerSetUpView = false
        showQuestionView = true
        SoundManager.instance.playSound (sound: .swipe)

        showAnswerView = false
        showFinishView = false
    }
    
    func showAnswerV(){
        playerSetUpView = false
        showQuestionView = false
        showAnswerView = true
        SoundManager.instance.playSound (sound: .swipe)

        showFinishView = false
    }
    
    func showFinishV(){
        playerSetUpView = false
        showQuestionView = false
        showAnswerView = false
        showFinishView = true
        SoundManager.instance.playSound (sound: .swipe)

    }
    
    
    @Published var showPermitionAlert = false
    
    func checkPermition<Media:View>(photoToBeSaved: Media, withProportions: CGSize = CGSize(width: 1080, height: 1350)){
    PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
        DispatchQueue.main.async {
            switch status {
            case .notDetermined:
                print("notDetermined")
                self.checkPermition(photoToBeSaved: photoToBeSaved, withProportions: withProportions)
            case .restricted, .denied:
                self.showPermitionAlert.toggle()
            case .authorized:
                
                let view = photoToBeSaved.edgesIgnoringSafeArea(.all).dynamicTypeSize(.large)
                let screenshot = view.takeScreenshot(size: CGSize(width: withProportions.width/2, height: withProportions.height/2))
                UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil)
                
            case .limited:
                break
            @unknown default:
                break
            }
        }
    }
}
    
    func gotoAppPrivacySettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(url) else {
                  assertionFailure("Not able to open App privacy settings")
                  return
              }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
