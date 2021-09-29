//
//  HistoryDetailViewModel.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/25/21.
//

import UIKit

protocol HistoryDetailViewModelProtocol {
    var viewBackground : UIColor { get }
    var datas: MainModel? { get set }
    var welcome : Welcome? { get }
    func getData(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void)
}


final class HistoryDetailViewModel : HistoryDetailViewModelProtocol {
    var welcome: Welcome? {
        model.datas
    }
    
     var datas: MainModel?
     
    private let model : HistoryDetailModelProtocol
    
    
    init(mainModel: MainModel? ,model : HistoryDetailModelProtocol = HistoryDetailModel()) {
        self.model = model
        self.datas = mainModel
    }
    
    func getData(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void) {
        model.getData(content: content, errorContent: errorContent)
    }
    
  
    let viewBackground = Constants.Style.Color.systembackground
    
    
}




