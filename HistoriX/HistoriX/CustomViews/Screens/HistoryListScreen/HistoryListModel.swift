//
//  HistoryListModel.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/11/21.
//

import Foundation


protocol HistoryListModelProtocol {
    var datas : Welcome? { get set }
    func getDatas(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void)

}

class HistoryListModel : HistoryListModelProtocol {
    var datas: Welcome?
    private let service : HistoryServiceDelegate = HistoryService()

    
    func getDatas(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void) {
        service.HistoryRequest(router: MainModelRouter.getDatFromWelcome, decodingType: Welcome.self) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.datas = data
                    print(self.datas)
                    content()
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    errorContent(error)
                }
            }
            
        }
    }

}
