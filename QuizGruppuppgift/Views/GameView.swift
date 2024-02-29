//
//  GameView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import SwiftUI

struct GameView: View {
    @State var questionAnswer: Bool = false
    
    var body: some View {
        VStack {
            
            QuestionView()
            AnswerView()
            
        }
    }
}

#Preview {
    GameView()
}
