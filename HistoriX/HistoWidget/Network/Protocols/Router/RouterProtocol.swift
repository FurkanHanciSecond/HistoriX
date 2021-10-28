//
//  RouterProtocol.swift
//  HistoWidgetExtension
//
//  Created by Furkan Hanci on 10/28/21.
//

import Foundation


protocol RouterProtocol {
  typealias Parameters = [String: Any]
  var host: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
   var scheme: String { get }
  var headers: [HTTPHeader] { get }
  var parameters: Parameters { get }
  var parameterEncoding: ParameterEncoding { get }
  func withURLRequest() throws -> URLRequest
}

extension RouterProtocol {
  func withURLRequest() throws -> URLRequest {
    var component = URLComponents()
    component.scheme = scheme
    component.host = host
    component.path = path

    if parameterEncoding == .url {
        component.queryItems = parameters.map{ (key, value) in
        return URLQueryItem(name: key, value: String(describing: value))
      }
    }

    guard let url = component.url else {
      throw HistoWidgetError.urlError
    }

    var urlRequest = URLRequest(url: url)
    
    urlRequest.httpMethod = method.rawValue
    headers.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.field) }
    
    switch parameterEncoding {
    case .json:
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

    default:
        break;
    }
    

    return urlRequest
  }
}
