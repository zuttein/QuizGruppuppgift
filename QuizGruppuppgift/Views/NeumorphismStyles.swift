//
//  CustomToggleView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-03-13.
//

import SwiftUI

struct SimpleToggle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding(15)
                .contentShape(Circle())
        }
        .background(
            ColorfulBackground(isHighlighted: configuration.isOn, shape: Circle())
        )
    }
}

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.red)
                    .overlay(shape.stroke(LinearGradient(Color.lightShadow, Color.darkShadow), lineWidth: 4))
                    .shadow(color: Color.darkShadow, radius: 5, x: -5, y: -6)
                    .shadow(color: Color.lightShadow, radius: 5, x: 5, y: 5)
            } else {
                shape
                    .fill(Color.green)
                    .overlay(shape.stroke(LinearGradient(Color.black), lineWidth: 4))
                    .shadow(color: Color.darkShadow, radius: 5, x: 5, y: 5)
                    .shadow(color: Color.lightShadow, radius: 5, x: -5, y: -5)
            }
        }
    }
}


extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
