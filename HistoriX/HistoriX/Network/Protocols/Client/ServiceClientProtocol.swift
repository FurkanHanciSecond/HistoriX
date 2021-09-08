//
//  ServiceClientProtocol.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/8/21.
//

import Foundation

protocol HistoryServiceDelegate {
    func HistoryRequestWithData(router : RouterProtocol , currentDate : Date , completion : @escaping (Result<Welcome , HistoryError>) -> Void)
    func HistoryRequest<K: Codable>(router: RouterProtocol, decodingType: K.Type, completion: @escaping (Result<K, HistoryError>) -> Void)

}
