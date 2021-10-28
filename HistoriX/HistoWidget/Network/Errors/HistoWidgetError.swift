//
//  HistoWidgetError.swift
//  HistoWidgetExtension
//
//  Created by Furkan Hanci on 10/28/21.
//

import Foundation


enum HistoWidgetError : String , Error {
    case genericError = "Generic Error"
    case decodingError = "Decoding Error"
    case responseError = "Response Error"
    case dataError = "Data error"
    case urlError = "Invalid URL"
    case coreDataErr = "Saving Error"
    case coreDataDeleteErr = "Delete Error"
}
