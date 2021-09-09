//
//  ServiceClient.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/8/21.
//

import Foundation


final class HistoryService : HistoryServiceDelegate {
  
    func HistoryRequest<K>(router: RouterProtocol, decodingType: K.Type, completion: @escaping (Result<K, HistoryError>) -> Void) where K : Decodable, K : Encodable {
        
        let request : URLRequest
        
        do {
            request = try router.withURLRequest()
        } catch  {
            completion(.failure( error as! HistoryError))
        }
        
        
        
    }
    
    
    func HistoryRequestWithData(router: RouterProtocol, currentDate: Date, completion: @escaping (Result<Welcome, HistoryError>) -> Void) {
        
    }
    
  
    
}
