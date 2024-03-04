//
//  DateExtention.swift
//  QuizGruppuppgift
//
//  Created by Gentjan Manuka on 2024-03-01.
//

import Foundation

enum DateType : String {
    case hour = "HH:mm" // return 19:00
    case date = "EEEE d MMMM" //return Fredag 12 mars
    case dateAndHour = "EEEE d MMMM HH:mm"
    case fullDate = "EEEE d MMMM yyyy" //return full date
    case day = "dd"
    case weekday = "EEE"
    case month = "MMM"
    case dateJSON = "yyyy-MM-dd'T'HH:mm:ssZ"
}

extension Date {
    func extractDate(to dateType: DateType) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateType.rawValue
        return dateFormatter.string(from: self)
    }
}
