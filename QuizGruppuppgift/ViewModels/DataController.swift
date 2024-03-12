//
//  DataController.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-02-28.
//

import Foundation


class DataController: ObservableObject {
    static let shared = DataController()
    
    @Published var numberOfQuestions: Int = 10
    @Published var category: [String] = ["Mixed","General Knowledge","Books","Film","Music","Musicals & Theatres","Television","Video Games","Board Games","Science & Nature","Computers","Mathematics","Mythology","Sports","Geography","Politics","Art","Celebrities","Animals","Vehicles","Comics","Gadgets","Japanese Anime & Manga","Cartoon & Animations","History"]
    @Published var categorySelection: String = "Mixed"
    @Published var difficulty: [String] = ["Easy","Medium","Hard"]
    @Published var difficultySelection = "Easy"
    @Published var questions: [Question] = []
    @Published var currentQuestion = Question(question: "Question missing", answer: true)
    
    // Fetch questions from API
    func fetchQuestions(category: String, difficulty: String, amountQuestions: Int, completion: @escaping ([Question]?) -> Void) {
        
        questions.self = []
        var allQuestions: [Question] = []
        var categoryId: Int = 0
        var urls = [URL(string: "https://opentdb.com/api.php?amount=10&type=boolean")]
        
        switch categorySelection {
        case "General Knowledge":
            categoryId = 9
        case "Books":
            categoryId = 10
        case "Film":
            categoryId = 11
        case "Music":
            categoryId = 12
        case "Musicals & Theatres":
            categoryId = 13
       
        case "Television":
            categoryId = 14
        case "Video Games":
            categoryId = 15
        case "Board Games":
            categoryId = 16
        case "Science & Nature":
            categoryId = 17
        case "Computers":
            categoryId = 18
        case "Mathematics":
            categoryId = 19
        case "Sports":
            categoryId = 21
        case "Mythology":
            categoryId = 20
        case "Geography":
            categoryId = 22
        case "History":
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
            categoryId = 0
        }
        
        urls.removeAll()
        urls.append(URL(string: "https://opentdb.com/api.php?amount=\(amountQuestions)&category=\(categoryId)&difficulty=\(difficulty.lowercased())&type=boolean"))
        urls.append(URL(string: "https://opentdb.com/api.php?amount=\(amountQuestions)&category=\(categoryId)&type=boolean"))
        urls.append(URL(string: "https://opentdb.com/api.php?amount=\(amountQuestions)&type=boolean"))
        print(urls)
        
        // Helper function to make an API call and parse the response
        func apiCall(urls: [URL], attemptsLeft: Int, isFirstCall: Bool, completion: @escaping ([Question]?) -> Void) {
            guard attemptsLeft > 0 else {
                completion(nil)
                return
            }
            
            guard let url = urls.first else {
                // No more URLs to try, return nil
                completion(nil)
                return
            }
            
            // Define the delay time (5 seconds) for consecutive calls
            let delaySeconds: Double = isFirstCall ? 0 : 5.0
            
            // Calculate the dispatch time
            let dispatchTime = DispatchTime.now() + delaySeconds
            
            // Delay the API call for consecutive calls
            DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    print("Calling URL: \(url)")
                    guard let data = data, error == nil else {
                        print("Error: \(error?.localizedDescription ?? "Unknown error")")
                        // Retry with reduced attempts and remaining URLs
                        apiCall(urls: Array(urls.dropFirst()), attemptsLeft: attemptsLeft - 1, isFirstCall: isFirstCall, completion: completion)
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
                            
                            if fetchedQuestions.isEmpty {
                                // No questions fetched from this URL, try next URL
                                apiCall(urls: Array(urls.dropFirst()), attemptsLeft: attemptsLeft - 1, isFirstCall: false, completion: completion)
                            } else {
                                completion(fetchedQuestions)
                            }
                        } else {
                            print("Invalid JSON format")
                            // Retry with reduced attempts and remaining URLs
                            apiCall(urls: Array(urls.dropFirst()), attemptsLeft: attemptsLeft - 1, isFirstCall: isFirstCall, completion: completion)
                        }
                    } catch {
                        print("Error parsing JSON: \(error)")
                        // Retry with reduced attempts and remaining URLs
                        apiCall(urls: Array(urls.dropFirst()), attemptsLeft: attemptsLeft - 1, isFirstCall: isFirstCall, completion: completion)
                    }
                }.resume()
            }
        }
        
        let unwrappedURLs = urls.compactMap { $0 }
        
        apiCall(urls: unwrappedURLs, attemptsLeft: 3, isFirstCall: true) { fetchedQuestions in
            if let fetchedQuestions = fetchedQuestions {
                DispatchQueue.main.async {
                    self.questions.append(contentsOf: fetchedQuestions)
                }
            }
            
            // Perform completion with allQuestions or nil if fetching failed
            completion(allQuestions.isEmpty ? nil : allQuestions)
        }
    }
}
