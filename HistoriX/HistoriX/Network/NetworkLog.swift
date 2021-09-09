//
//  NetworkLog.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/8/21.
//

import Foundation


struct NetworkLog {

  static func log(request: URLRequest,
                  fileName: String = #file,
                  functionName: String = #function,
                  lineNumber: Int = #line) {

    print("Request")
    defer { print("END") }

    print("Called  \(fileName.components(separatedBy: "/").last ?? fileName) - \(functionName) at line \(lineNumber)")

    let urlAsString = request.url?.absoluteString ?? ""
    let urlComponents = URLComponents(string: urlAsString)

    let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
    let path = "\(urlComponents?.path ?? "")"
    let query = "\(urlComponents?.query ?? "")"
    let host = "\(urlComponents?.host ?? "")"

    var logOutput = """
        \(urlAsString) \n\n
        \(method) \(path)?\(query) HTTPS/1.1 \n
        HOST: \(host)\n
        """
    for (key,value) in request.allHTTPHeaderFields ?? [:] {
      logOutput += "\(key): \(value) \n"
    }
    if let body = request.httpBody {
      logOutput += "\n \(String(data: body, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? "")"
    }

    print(logOutput)
  }

  static func log(response: HTTPURLResponse, model: Decodable? = nil, error: Error?) {
    print("RESPONSE")
    defer { print("END") }

    let statusCode = response.statusCode

    print("Status Code: \(statusCode)")
    print("----------------------------")

    if let responseUrl = response.url {
      print("Response URL: \(responseUrl)")
    }
    print("----------------------------")

    print("Response Model: \(String(describing: model))")
    
  }
}
