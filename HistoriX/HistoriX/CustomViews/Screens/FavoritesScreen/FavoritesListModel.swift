//
//  FavoritesListModel.swift
//  HistoriX
//
//  Created by Furkan Hanci on 10/19/21.
//

import UIKit

protocol FavoritesListModelProtocol {
    var events : [Events]? { get set }
    func fetchEvents(content : @escaping () -> Void , errorContent: @escaping (HistoryError) -> Void)
    
}

class FavoritesListModel : FavoritesListModelProtocol {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var events: [Events]?
    
    func fetchEvents(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void) {
        do {
            self.events = try context.fetch(Events.fetchRequest())
        } catch  {
         print("error when saving datas to db")
        }
    }
}
    
    

