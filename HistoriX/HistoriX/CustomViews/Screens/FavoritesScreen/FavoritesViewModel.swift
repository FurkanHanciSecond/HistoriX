//
//  FavoritesViewModel.swift
//  HistoriX
//
//  Created by Furkan Hanci on 10/19/21.
//

import UIKit

protocol FavoritesListViewModelProtocol {
    var title : String { get }
    var viewBackground : UIColor { get }
    var events : [Events]? { get }
    func getEvents(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void)
}

final class FavoritesListViewModel : FavoritesListViewModelProtocol {
    
    var events: [Events]? {
        model.events
    }
    
    private let model : FavoritesListModelProtocol
    
    
    init(model : FavoritesListModelProtocol = FavoritesListModel()) {
        self.model = model
    }
    
    func getEvents(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void) {
        model.fetchEvents(content: content, errorContent: errorContent)
    }
    
    let viewBackground = Constants.Style.Color.systembackground
    let title = Constants.Text.Bar.favorites
}
