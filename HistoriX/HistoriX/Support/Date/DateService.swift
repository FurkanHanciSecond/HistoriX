//
//  DateService.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/8/21.
//

import Foundation


class DateService {
    static let shared = DateService()
    
    private init() { }
    
    func getCurrentMonth() -> Int {
        let currentDate = Date()

        let nameFormatter = DateFormatter()
        nameFormatter.dateFormat = "MMMM" // format January, February, March, ...

        let name = nameFormatter.string(from: currentDate)
        let index = Calendar.current.component(.month, from: currentDate) // format 1, 2, 3, ...

        print(name)
        print(index)
        
        return index
    }
    
    
    func getCurrentDayOfMonth() -> Int {
      
        let formatter = DateFormatter()
        let now = Date()
        let dateString = formatter.string(from:now)
         let date = formatter.date(from: dateString)
        formatter.dateFormat = "yyyy"
        let day = formatter.string(from: date!)
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss 'UTC'"
        print(day) // 2018 12 24
        
        return Int(day)!
    }
}
