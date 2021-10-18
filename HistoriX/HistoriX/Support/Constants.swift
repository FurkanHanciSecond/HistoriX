//
//  Constants.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/5/21.
//

import UIKit


struct Constants {
    static let baseURL = "history.muffinlabs.com"
    static let defaultUrl = "https://en.wikipedia.org/wiki/Main_Page"
    
    struct Cell {
        static let cellId = "HistoryCell"
        static let favoritesCell = "FavoritesCell"
    }
    
    struct Notification {
        static let id = "HistoryNotification"
        static let title = ""
        static let subtitle = ""
        static let body = ""
    }
    
    struct Text {
        
        enum Bar {
          static let events = "What Happened"
            static let support = "SupportMe"
            static let favorites = "Favorites"
        }
        
        enum Error {
            static let ok = "OK"
            static let oops = "Oops an error occurred"
        }
        
        enum Button {
            static let support = "SUPPORT ME!"
            static let addFavorites = "Add To Favorites"
        }
    }
       
    
    struct Style {
        enum Color {
            static let systembackground = UIColor.systemBackground
            static let green = UIColor.green
            static let lightGray = UIColor.systemGray5
            static let black = UIColor.black
            static let label = UIColor.label
            static let red = UIColor.red
            static let white = UIColor.white
            static let tabbBar = UIColor.tabbBarColor
        }
        
        enum Image {
            static let arrowRight =  UIImage(systemName: "arrow.right")
           static let events = UIImage(systemName: "list.bullet")
            static let support = UIImage(systemName: "hand.thumbsup.fill")
            static let favorites = UIImage(systemName: "heart.fill")
        }
    }
}
