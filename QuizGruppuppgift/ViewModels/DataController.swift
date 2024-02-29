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
    @Published var difficulty: [String] = ["Easy","Medium","Hard"]
    @Published var difficultySelection = 0
    @Published var questions: [Question] = []
    

    
    
    @MainActor
    func fetchData() async{
        let url = "https://opentdb.com/api.php?amount=\(numberOfQuestions)&difficulty=\(difficulty[2].lowercased())&type=boolean"
        
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
