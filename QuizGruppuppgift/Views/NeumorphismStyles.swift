//
//  CustomToggleView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-03-13.
//

import SwiftUI

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.green)
                    .overlay(shape.stroke(LinearGradient(Color.black), lineWidth: 4))
                    .shadow(color: Color.darkShadow, radius: 5, x: 5, y: 5)
                    .shadow(color: Color.lightShadow, radius: 5, x: -5, y: -5)
                
            } else {
                shape
                    .fill(Color.red)
                    .overlay(shape.stroke(LinearGradient(Color.lightShadow, Color.darkShadow), lineWidth: 4))
                    .shadow(color: Color.darkShadow, radius: 5, x: -5, y: -6)
                    .shadow(color: Color.lightShadow, radius: 5, x: 5, y: 5)
            }
        }
    }
}


extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct NeumorphismModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.offWhite)
            .cornerRadius(10)
            .shadow(color: Color.lightShadow,
                    radius: 5, x: -5, y: -5)
            .shadow(color: Color.darkShadow,
                    radius: 5, x: 5, y: 5)
    }
}

struct InnerNeumorphismModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.offWhite)
            .cornerRadius(10)
            .overlay(
                Rectangle()
                    .stroke(Color.offWhite, lineWidth: 5)
                    .shadow(color: Color.darkShadow,
                            radius: 5, x: 5, y: 5)
                    .shadow(color: Color.lightShadow,
                            radius: 5, x: -2, y: -2)
                    .clipShape(
                        Rectangle()
            )
        )
    }
}

struct NeumorphismButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        Group{
            if configuration.isPressed {
                configuration.label
                    .modifier(InnerNeumorphismModifier())
            } else {
                configuration.label
                    .modifier(NeumorphismModifier())
            }
                
        }
    }
}


