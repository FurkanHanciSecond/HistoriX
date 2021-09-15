//
//  Constants.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/5/21.
//

import UIKit


struct Constants {
    static let baseURL = "history.muffinlabs.com"
    struct Cell {
        static let cellId = "HistoryCell"
    }
    
    struct Text {
        
        enum Bar {
          static let history = "Histories"
        }
        
        enum Error {
            static let ok = "OK"
            static let oops = "Oops an error occurred"
        }
    }
       
    
    struct Style {
        enum Color {
            static let background = UIColor.systemBackground
        }
    }
}
