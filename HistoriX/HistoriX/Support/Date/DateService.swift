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
    
    func getCurrentDate() {
        let currentDate = Date()

        let nameFormatter = DateFormatter()
        nameFormatter.dateFormat = "MMMM" // format January, February, March, ...

        let name = nameFormatter.string(from: currentDate)
        let index = Calendar.current.component(.month, from: currentDate) // format 1, 2, 3, ...

        print(name)
        print(index)
        
    }
}
