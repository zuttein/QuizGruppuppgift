//
//  BoolExtention.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-03-12.
//

import SwiftUI

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
            .replaceAll(of: "&rsquo;", with: "\'")
            .replaceAll(of: "&ocirc;", with: "Ô")
    }
    
}
