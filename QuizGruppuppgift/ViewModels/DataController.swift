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
    @Published var currentQuestion = Question(question: "Question missing", answer: "true")
    
    // Fetch questions from API
    
    func getCategory() -> Int {
        var categoryId: Int = 0
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
        return categoryId
    }
    
    func getApiURL(worksWithDifficulty: Bool = true) -> String {
        if worksWithDifficulty {
            return "https://opentdb.com/api.php?amount=\(numberOfQuestions)&category=\(getCategory())&difficulty=\(difficultySelection.lowercased())&type=boolean"
        } else {
            return "https://opentdb.com/api.php?amount=\(numberOfQuestions)&category=\(getCategory())&type=boolean"
        }
    }
    
   
    @MainActor
    func fetchData(worksWithDifficulty: Bool = true) async {
        print(getApiURL(worksWithDifficulty: worksWithDifficulty))
        let apiService = APIService(urlString: getApiURL(worksWithDifficulty: worksWithDifficulty))
        
        do{
            guard let response: APIResponse = try await apiService.getJSON() else {return}
            if response.response_code == 1 {
                await fetchData(worksWithDifficulty: false)
                
            } else {
                questions.removeAll()
                questions.append(contentsOf: response.results)
            }
            sleep(5)
        } catch {
            print(error.localizedDescription)
            print(error.self)
        }
    }
}


extension String {
    
    public func replaceAll(of pattern:String,
                           with replacement:String,
                           options: NSRegularExpression.Options = []) -> String{
      do{
        let regex = try NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(0..<self.utf16.count)
        return regex.stringByReplacingMatches(in: self, options: [],
                                              range: range, withTemplate: replacement)
      }catch{
        NSLog("replaceAll error: \(error)")
        return self
      }
    }
    
    public func replaceQuotes() -> String {
        return self.replaceAll(of: "&quot;", with: "\"")
            .replaceAll(of: "&#039;", with: "\'")
            .replaceAll(of: "&deg;", with: "°")
    }
    
}
