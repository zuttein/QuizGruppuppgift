//
//  SoundEffects.swift
//  QuizGruppuppgift
//
//  Created by Joakim.Bjärkstedt on 2024-03-14.
//

import SwiftUI
import AVKit
import AVFoundation
class SoundManager {
    
    static let instance = SoundManager()
    // Singleton
    var mediaPlayer: AVAudioPlayer?
    
    enum SoundOption: String {
        case swipe
        case buttonpop
        case gamefinish
    }
    
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        do {
            mediaPlayer = try AVAudioPlayer(contentsOf: url)
            mediaPlayer?.play()
            mediaPlayer?.volume = 0.1
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
    
    
    struct SoundsBootcamp: View{
        var body: some View {
            VStack(spacing: 40) {
                Button("Play sound 1"){
                    SoundManager.instance.playSound (sound: .buttonpop)
                }
                Button ("Play sound 2") {
                    SoundManager.instance.playSound(sound: .swipe)
                    
                }
                Button ("Play sound 3") {
                    SoundManager.instance.playSound(sound: .gamefinish)
                    
                }
            }
        }
    }
    
    struct SoundsBootcamp_Previews : PreviewProvider{
        static var previews: some View{
            SoundsBootcamp()
        }
    }
}


