//
//  DataController.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-28.
//

import Foundation

class DataController: ObservableObject {
    
    
    @Published var numberOfQuestions: Int = 10
    @Published var category: [String] = ["Blandat (Hämtar frågor från alla APIns kategorier)","Allmänbildning (General knowledge)","Nöje (Entertainment: *, Celebrities)","Naturvetenskap (Science & Nature, Animals, Science: *, Vehicles)","Samhällsvetenskap (Mythology, Geography, History, Politics, Art)","Sport (Sports)"]
    @Published var categorySelection: String = ""
    @Published var difficulty: [String] = ["Easy","Medium","Hard"]
    @Published var difficultySelection = "Easy"
    @Published var questions: [Question] = []
    

    
    func buildURLString(categori: String, difficulty: String) {
        
        
        /*
         if category == samhällskunskap
            bygg url anropa fetchData(med url) så många gånger man behöver för att matcha antalet frågor man väljer
            populate questions
         
         */
        
        
      //  let url = "https://opentdb.com/api.php?amount=\(numberOfQuestions)&difficulty=\(difficulty[0].lowercased())&type=boolean"
        
    }
    
    
    @MainActor
    func fetchData(url: String) async{
        
        
        do{
            let apiService = APIService(urlString: url)
            guard let data : Response = try await apiService.getJSON() else {return}
            self.questions = data.results
            
        } catch {
            print("=")
            print("=")
            print("=")
            print("=")
            print(error.localizedDescription)
            print("=")
            print("=")
            print("=")
            print("=")
        }
        
    }
    
    
    
    
}
