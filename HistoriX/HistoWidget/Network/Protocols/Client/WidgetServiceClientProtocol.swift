//
//  WidgetServiceClientProtocol.swift
//  HistoWidgetExtension
//
//  Created by Furkan Hanci on 10/28/21.
//

import Foundation


protocol WidgetServiceDelegate {
    func WidgetRequestWithData(router : RouterProtocol , currentDate : Date , completion : @escaping (Result<Data , HistoWidgetError>) -> Void)
    func WidgetRequest<K: Codable>(router: RouterProtocol, decodingType: K.Type, completion: @escaping (Result<K, HistoWidgetError>) -> Void)
}
