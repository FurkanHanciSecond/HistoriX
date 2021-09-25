//
//  HistoryDetailModel.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/25/21.
//

import UIKit

protocol HistoryDetailModelProtocol {
    var data : MainModel? { get set }
    
    func getData(content: @escaping () -> Void , errorContent: @escaping (HistoryError) -> Void)
}

class HistoryDetailModel : HistoryDetailModelProtocol {
    var data: MainModel?
    let service: HistoryServiceDelegate = HistoryService()

    func getData(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void) {
        service.HistoryRequest(router: MainModelRouter.getDatFromWelcome, decodingType: MainModel.self) { [ weak self] result in
            switch result {
              case .success(let data):
                self?.data = data
                content()
              case .failure(let error):
                errorContent(error)
              }
        }
    }
    
    
}
