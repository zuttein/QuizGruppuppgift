//
//  ProgressBar.swift
//  QuizGruppuppgift
//
//  Created by Kevin.Jasarovski on 2024-03-11.
//
import SwiftUI
import Foundation

struct ProgressView: View {
    var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                
                Rectangle()
                    .frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color.green)
            }
            .cornerRadius(45.0)
        }
        .frame(width: 100, height: 30)

    }
}
