//
//  QuestionView.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-29.
//

import SwiftUI

struct QuestionView: View {


@State var numbersOfQuestion: String = "Question 1/10"
@State var Question: String = "Is Stockholm the capital city of Sweden"
@State private var progressValue: Float = 0.3
   
    var body: some View {
       
       ZStack{
           
           Color(.offwhite).ignoresSafeArea()
       
           VStack(spacing: 10) {
           
           Text(numbersOfQuestion)
               .font(.title)
               .padding(0)
               .frame(maxHeight: .infinity, alignment: .top)
               
               
           Text(Question)
                   .padding(.horizontal)
               .font(.title2)
               .frame(maxHeight: .infinity, alignment: .top)

               VStack {
                   
               
               HStack  {
                   
                   Circle()
                       .fill(.blue)
                       .frame(width: 25 ,height: 25)
                   
                   Circle()
                       .fill(.green)
                       .frame(width: 25, height: 25)
                   
                   Circle()
                       .fill(.white)
                       .frame(width: 25, height: 25)
                   
                   Circle()
                       .fill(.white)
                       .frame(width: 25, height: 25)
                   
                   Text("TRUE")
                       .padding(10)
                       .fontWeight(.bold)
                       .font(.title2)
                       .multilineTextAlignment(.leading)
                   
               }

               HStack(spacing: 10)  {
                   
                   Circle()
                       .fill(.red)
                       .frame(width: 25 ,height: 25)
                   
                   Circle()
                       .fill(.yellow)
                       .frame(width: 25, height: 25)
                   
                   Circle()
                       .fill(.purple)
                       .frame(width: 25, height: 25)
                   
                   Circle()
                       .fill(.white)
                       .frame(width: 25, height: 25)
                   
                   Text("FALSE")
                       .padding(10)
                       .font(.title2)
                       .fontWeight(.bold)

                       .multilineTextAlignment(.leading)
               }
               
               Spacer()

               VStack( spacing: 10) {
                
                   ProgressView(value: progressValue) { Text("Kevin")}
                       .padding(.horizontal, 100.0)

                   
                   ProgressView(value: progressValue) { Text("Genti")}
                       .padding(.horizontal, 100.0)

                   
                   ProgressView(value: progressValue) { Text("Joakim")}
                       .padding(.horizontal, 100.0)

                   
                   ProgressView(value: progressValue) { Text("Katja")}
                       .padding(.horizontal, 100.0)
                   
                   ProgressView(value: progressValue) { Text("Dennis")}
                       .padding(.horizontal, 100.0)
               }
               
               Spacer()

               HStack(spacing: 50) {
                   
                   VStack(spacing: 10) {
                       
                       HStack(spacing: 10)  {
                           
                           Circle()
                               .fill(.yellow)
                               .frame(width: 25, height: 25)
                           
                           Text("Kevin")
                               .multilineTextAlignment(.leading)
                           
                       }
                       
                       HStack(spacing: 10)  {
                           
                           Circle()
                               .fill(.yellow)
                               .frame(width: 25, height: 25)
                           
                           Text("Dennis")
                               .multilineTextAlignment(.leading)
                           
                       }
                       
                       HStack(spacing: 10)  {
                           
                           Circle()
                               .fill(.yellow)
                               .frame(width: 25, height: 25)
                           
                           Text("Joakim")
                               .multilineTextAlignment(.leading)
                           
                       }
                       
                       HStack(spacing: 10)  {
                           
                           Circle()
                               .fill(.yellow)
                               .frame(width: 25, height: 25)
                           
                           Text("Katja")
                               .multilineTextAlignment(.leading)
                           
                       }
                       
                       HStack(spacing: 10)  {
                           
                           Circle()
                               .fill(.yellow)
                               .frame(width: 25, height: 25)
                           
                           Text("Genti")
                               .multilineTextAlignment(.leading)
                           
                       }
                   }

                       VStack{
                       
                       Button(action: {
                           
                       }) {
                           Text("Submit")
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
                       
                   }) {
                       Text("Cancel")
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
   }

    
    
   
}
}



#Preview {
   QuestionView()
}
