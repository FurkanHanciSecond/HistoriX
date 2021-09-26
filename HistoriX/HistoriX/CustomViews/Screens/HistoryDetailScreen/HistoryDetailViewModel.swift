//
//  HistoryDetailViewModel.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/25/21.
//

import UIKit

protocol HistoryDetailViewModelProtocol {
    var mainModel: [MainModel]? { get }
    func getData(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void)
}


final class HistoryDetailViewModel : HistoryDetailViewModelProtocol {
    
    var mainModel: [MainModel]? {
        model.welcomeModel?.data.events
    }
    private let model : HistoryDetailModelProtocol
    
    
    init(model : HistoryDetailModelProtocol = HistoryDetailModel()) {
        self.model = model
    }
    
    func getData(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void) {
        model.getData(content: content, errorContent: errorContent)
    }
    
  
    
    
}


