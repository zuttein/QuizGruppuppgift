//
//  DataController.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-28.
//

import Foundation

class DataController: ObservableObject {
    
    
    @Published var numberOfQuestions: Int = 10
    @Published var category: [String] = ["Mixed","General Knowledge","Entertainment","Social Sciences", "Natural Sciences", "Sport"]
    @Published var categorySelection: String = "Mixed"
    @Published var difficulty: [String] = ["Easy","Medium","Hard"]
    @Published var difficultySelection = "Easy"
    @Published var questions: [Question] = []
    
    
    // Fetch questions from API
    func fetchQuestions(category: String, difficulty: String, amountQuestions: Int, completion: @escaping ([Question]?) -> Void) {
        
        questions.self = []
        var allQuestions: [Question] = []
        var url: URL? = nil
        
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
        if category == "Mixed" {
            url = URL(string: "https://opentdb.com/api.php?amount=\(amountQuestions)&difficulty=\(difficulty)&type=boolean")
            apiCall(url: url!)
            print(url!)
        } else if category == "General Knowledge" || category == "Sport" {
            let categoryId = category == "General Knowledge" ? "9" : "21"
            url = URL(string: "https://opentdb.com/api.php?amount=\(amountQuestions)&category=\(categoryId)&difficulty=\(difficulty)&type=boolean")
            apiCall(url: url!)
            print(url!)
        } else {
            // Define category numbers based on category names
            let categoryNumbers: [Int]
            switch category {
            case "Natural Sciences":
                categoryNumbers = [17, 18, 19, 27, 29, 30]
            case "Social Sciences":
                categoryNumbers = [20, 22, 23, 24, 25]
            //Entertainment category / default:
            default:
                categoryNumbers = [10, 11, 12, 13, 14, 15, 16, 26, 28, 31, 32]
            }
        
            
            //                // Fetch questions for each category
            // Fungerade inte p.g.a. att anrop till samma kategori strax efter varandra ger samma fråga om och om igen.
            //                for _ in 0..<amountQuestions {
            //                    let randomCategory = categoryNumbers.randomElement()!
            //                    url = URL(string: "https://opentdb.com/api.php?amount=1&category=\(randomCategory)&difficulty=\(difficulty)&type=boolean")
            //                    apiCall(url: url!)
            //                }
            
            
            // Initialize an array to store the number of questions for each category
            var amountQuestionsPerCategory = [Int](repeating: 0, count: categoryNumbers.count)
            
            // Distribute the total number of questions randomly among the categories
            for _ in 0..<amountQuestions {
                let randomCategoryIndex = Int.random(in: 0..<categoryNumbers.count)
                amountQuestionsPerCategory[randomCategoryIndex] += 1
            }
            print(amountQuestionsPerCategory)
            
            // Fetch questions for each category
            for (index, categoryNumber) in categoryNumbers.enumerated() {
                if amountQuestionsPerCategory[index] != 0 {
                    url = URL(string: "https://opentdb.com/api.php?amount=\(amountQuestionsPerCategory[index])&category=\(categoryNumber)&difficulty=\(difficulty)&type=boolean")
                    print(url!)
                    apiCall(url: url!)
                }
            }
        }
    }

    
//    func buildURLString(categori: String, difficulty: String) {
//        
//        
//        /*
//         if category == samhällskunskap
//            bygg url anropa fetchData(med url) så många gånger man behöver för att matcha antalet frågor man väljer
//            populate questions
//         
//         */
//        
//        
//      //  let url = "https://opentdb.com/api.php?amount=\(numberOfQuestions)&difficulty=\(difficulty[0].lowercased())&type=boolean"
//        
//    }
//    
//    
//    @MainActor
//    func fetchData(url: String) async{
//        
//        
//        do{
//            let apiService = APIService(urlString: url)
//            guard let data : Response = try await apiService.getJSON() else {return}
//            self.questions = data.results
//            
//        } catch {
//            print("=")
//            print("=")
//            print("=")
//            print("=")
//            print(error.localizedDescription)
//            print("=")
//            print("=")
//            print("=")
//            print("=")
//        }
//        
//    }
    
    
    
    
}
