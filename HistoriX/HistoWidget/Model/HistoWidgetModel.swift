//
//  HistoWidgetModel.swift
//  HistoWidgetExtension
//
//  Created by Furkan Hanci on 10/29/21.
//

import Foundation



// MARK: - Welcome
struct Welcome: Codable , Hashable {
    let date: String
    let url: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable , Hashable {
    let events, births, deaths: [MainModel]

    enum CodingKeys: String, CodingKey {
        case events = "Events"
        case births = "Births"
        case deaths = "Deaths"
    }
}

// MARK: - Birth
struct MainModel: Codable , Hashable {
    let year, text, html, noYearHTML: String
    enum CodingKeys: String, CodingKey {
        case year, text, html
        case noYearHTML = "no_year_html"
    }
}
