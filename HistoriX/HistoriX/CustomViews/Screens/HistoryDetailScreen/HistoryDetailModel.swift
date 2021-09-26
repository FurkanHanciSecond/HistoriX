//
//  HistoryDetailModel.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/25/21.
//

import UIKit

protocol HistoryDetailModelProtocol {
    var datas : Welcome? { get set }
    func getData(content: @escaping () -> Void , errorContent: @escaping (HistoryError) -> Void)
}

class HistoryDetailModel : HistoryDetailModelProtocol {
    var datas : Welcome?
    let service: HistoryServiceDelegate = HistoryService()

    func getData(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void) {
        service.HistoryRequest(router: MainModelRouter.getDatFromWelcome, decodingType: Welcome.self) { [ weak self] result in
            switch result {
              case .success(let data):
                self?.datas = data
                content()
              case .failure(let error):
                errorContent(error)
              }
        }
    }
    
    
}
