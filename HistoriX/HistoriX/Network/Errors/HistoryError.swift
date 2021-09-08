//
//  HistoryError.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/8/21.
//

import Foundation

enum HistoryError : String , Error {
    case genericError = "Generic Error"
    case decodingError = "Decoding Error"
    case responseError = "Response Error"
    case dataError = "Data error"
    case urlError = "Invalid URL"
}
