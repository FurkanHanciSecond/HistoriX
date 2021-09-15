//
//  HistoryListViewModel.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/11/21.
//

import UIKit

protocol HistoryListViewModelProtocol {
  var datas: [Welcome] { get }
    var viewBackground : UIColor { get }
    var title: String { get }
  func getDatas(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void)
}


class HistoryListViewModel : HistoryListViewModelProtocol {
  
    var datas: [Welcome] {
        model.datas
            .sorted { $0.date < $1.date }
     }
    
    private let model: HistoryListModelProtocol
    
    
    init(model : HistoryListModelProtocol = HistoryListModel()) {
        self.model = model
    }

    func getDatas(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void) {
        model.getDatas(content: content, errorContent: errorContent)

    }
    
    func title(for datas: Welcome) -> NSMutableAttributedString {
        let title = NSMutableAttributedString(string: "#\(datas.date) \(datas.data)")
      return title
    }
    
    let viewBackground = Constants.Style.Color.background
    let title = Constants.Text.Bar.history

}
