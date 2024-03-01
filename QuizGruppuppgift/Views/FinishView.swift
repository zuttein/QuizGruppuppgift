//
//  FinishView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import SwiftUI
import SwiftData

struct FinishView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State var game: Game? = nil
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    
}

#Preview {
    FinishView()
}
