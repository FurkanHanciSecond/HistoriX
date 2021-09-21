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
          static let events = "Events"
            static let support = "Support"
        }
        
        enum Error {
            static let ok = "OK"
            static let oops = "Oops an error occurred"
        }
    }
       
    
    struct Style {
        enum Color {
            static let background = UIColor.systemBackground
            static let green = UIColor.green
            static let lightGray = UIColor.systemGray5
            static let black = UIColor.black
            static let label = UIColor.label
            static let red = UIColor.red
        }
        
        enum Image {
            static let arrowRight =  UIImage(systemName: "arrow.right")
           static let events = UIImage(systemName: "list.bullet")
            static let support = UIImage(systemName: "hand.thumbsup.fill")
        }
    }
}
