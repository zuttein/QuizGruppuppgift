//
//  DataController.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-28.
//

import Foundation

class DataController: ObservableObject {
    
    
    @Published var numberOfQuestions: Int = 10
    @Published var category: [String] = ["Mixed","General Knowledge","Books","Film","Music","Musicals & Theatres","Television","Video Games","Board Games","Science & Nature","Computers","Mathematics","Mythology","Sports","Geography","Politics","Art","Celebrities","Animals","Vehicles","Comics","Gadgets","Japanese Anime & Manga","Cartoon & Animations"]
    @Published var categorySelection: String = "Mixed"
    @Published var difficulty: [String] = ["Easy","Medium","Hard"]
    @Published var difficultySelection = "Easy"
    @Published var questions: [Question] = []
    
    
    // Fetch questions from API
    func fetchQuestions(category: String, difficulty: String, amountQuestions: Int, completion: @escaping ([Question]?) -> Void) {
        
        questions.self = []
        var allQuestions: [Question] = []
        var categoryId: Int = 9
        var url = URL(string: "https://opentdb.com/api.php?amount=10&type=boolean")
        
        // Helper function to make an API call and parse the response
        func apiCall(url: URL) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    completion(nil)
                    return
                }
                
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let results = json?["results"] as? [[String: Any]] {
                        let fetchedQuestions = results.compactMap { result -> Question? in
                            if let question = result["question"] as? String,
                               let answerString = result["correct_answer"] as? String {
                                // Convert "True" or "False" string to Bool
                                let answer = answerString.lowercased() == "true"
                                return Question(question: question, answer: answer)
                                
                            }
                            return nil
                        }
                        
                        self.questions.append(contentsOf: fetchedQuestions)
                        allQuestions.append(contentsOf: fetchedQuestions)
                        
                    } else {
                        print("Invalid JSON format")
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
                
                // Call completion handler after all questions are fetched
                completion(allQuestions)
            }.resume()
        }
        
        // Generate URL based on category and other parameters
        if categorySelection == "Mixed" {
            url = URL(string: "https://opentdb.com/api.php?amount=\(amountQuestions)&difficulty=\(difficultySelection.lowercased())&type=boolean")
        }
        
        // Bugg in Api returns no questions when calling category 21, 25 or 29 with a difficulty choice, therefore querring for all difficulty levels.
        else if categorySelection == "Sports" || categorySelection == "Celebrities" || categorySelection == "Comics" {
            switch categorySelection {
            case "Sports":
                categoryId = 21
            case "Art":
                categoryId = 25
            case "Celebrities":
                categoryId = 26
            case "Comics":
                categoryId = 29
            default:
                categoryId = 9
            }
            url = URL(string: "https://opentdb.com/api.php?amount=\(amountQuestions)&category=\(categoryId)&type=boolean")
        }
        
        else {
            switch categorySelection {
            case "Books":
                categoryId = 10
            case "Film":
                categoryId = 11
            case "Music":
                categoryId = 12
            case "Musicals & Theatres":
                categoryId = 13
            case "Entertainment: Books":
                categoryId = 14
            case "Television":
                categoryId = 15
            case "Video Games":
                categoryId = 16
            case "Board Games":
                categoryId = 17
            case "Science & Nature":
                categoryId = 18
            case "Computers":
                categoryId = 19
            case "Mathematics":
                categoryId = 20
            case "Mythology":
                categoryId = 22
            case "Geography":
                categoryId = 23
            case "Politics":
                categoryId = 24
            case "Art":
                categoryId = 25
            case "Celebrities":
                categoryId = 26
            case "Animals":
                categoryId = 27
            case "Vehicles":
                categoryId = 28
            case "Comics":
                categoryId = 29
            case "Gadgets":
                categoryId = 30
            case "Japanese Anime & Manga":
                categoryId = 31
            case "Cartoon & Animations":
                categoryId = 32
            default:
                categoryId = 9
            }
            
            url = URL(string: "https://opentdb.com/api.php?amount=\(amountQuestions)&category=\(categoryId)&difficulty=\(difficultySelection.lowercased())&type=boolean")
        }
        
        print(url)
        apiCall(url: url!)
        
    }

}
