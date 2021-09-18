//
//  HistoryListViewModel.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/11/21.
//

import UIKit

protocol HistoryListViewModelProtocol {
  var datas: [MainModel]? { get }
    var viewBackground : UIColor { get }
    var title: String { get }
  func getDatas(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void)
}


class HistoryListViewModel : HistoryListViewModelProtocol {
  
    var datas: [MainModel]? {
        model.datas?.data.events

    }
    
    private let model: HistoryListModelProtocol
    
    
    init(model : HistoryListModelProtocol = HistoryListModel()) {
        self.model = model
    }

    func getDatas(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void) {
        model.getDatas(content: content, errorContent: errorContent)
    }
    
    func title(for datas: MainModel?) -> NSMutableAttributedString {
        let text = (datas?.text ?? "") + " " + (datas?.year ?? "")
        let title = NSMutableAttributedString(string: text)
      return title
    }
    
    let viewBackground = Constants.Style.Color.background
    let title = Constants.Text.Bar.history

}
