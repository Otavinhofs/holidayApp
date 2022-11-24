//
//  Holiday.swift
//  dataApp
//
//  Created by Otávio da Silva on 22/11/22.
//

import Foundation

struct Holiday: Codable {
    var date: Date
    var name: String
    
    func getMounth() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMMM"
        return dateFormater.string(from: date)
    }
    
    func holidayWeek() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE"
        return dateFormater.string(from: date)
    }
    func holidayDay() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd"
        return dateFormater.string(from: date)
    }
    
}


