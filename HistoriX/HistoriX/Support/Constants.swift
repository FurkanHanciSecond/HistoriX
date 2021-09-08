//
//  Constants.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/5/21.
//

import Foundation


struct Constants {
    static let baseURL = "https://history.muffinlabs.com/date/"
    struct Cell {
        static let cellId = "HistoryCell"
    }
    
    struct Text {
        enum Error {
            static let ok = "OK"
            static let oops = "Oops an error occurred"
        }
    }
}
