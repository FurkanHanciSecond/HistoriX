//
//  ServiceClient.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/8/21.
//

import Foundation


final class HistoryService : HistoryServiceDelegate {
    
    static let shared = HistoryService()

    
    func HistoryRequest<K: Codable>(router: RouterProtocol, decodingType: K.Type, completion: @escaping (Result<K, HistoryError>) -> Void) {

      let request: URLRequest

      do {
        request = try router.withURLRequest()
      } catch {
        completion(.failure(error as! HistoryError))
        return
      }

      NetworkLog.log(request: request)

      let session = URLSession(configuration: .default)

      session.dataTask(with: request) { (data, response, error) in
        guard error == nil else {
          completion(.failure(.genericError))
          return
        }

        guard let response = response as? HTTPURLResponse else {
          completion(.failure(.genericError))
          return
        }

        guard response.statusCode == HTTPStatus.success.rawValue else {
          NetworkLog.log(response: response, error: error)
          completion(.failure(.responseError))
          return
        }

        guard let data = data else {
          completion(.failure(.dataError))
          return
        }

        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase

          let model = try decoder.decode(K.self, from: data)
          NetworkLog.log(response: response, model: model, error: error)
            DispatchQueue.main.async {
                completion(.success(model))

            }
        } catch {
          completion(.failure(.decodingError))
        }
      }
      .resume()
    }
           


    
    func HistoryRequestWithData(router: RouterProtocol, currentDate: Date, completion: @escaping (Result<Data, HistoryError>) -> Void) {
        
        let request: URLRequest

            do {
                request = try router.withURLRequest()
            } catch {
              completion(.failure(error as! HistoryError))
              return
            }

            NetworkLog.log(request: request)
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { data, response, err in
            guard err == nil else {
                 completion(.failure(.genericError))
                 return
               }

               guard let response = response as? HTTPURLResponse else {
                 completion(.failure(.genericError))
                 return
               }

               guard response.statusCode == HTTPStatus.success.rawValue else {
                 NetworkLog.log(response: response, error: err)
                 completion(.failure(.responseError))
                 return
               }

               guard let data = data else {
                 completion(.failure(.dataError))
                 return
               }
            

            NetworkLog.log(response: response, model: data, error: err)
            completion(.success(data))
        }
        .resume()
        
    }
             
}
        
    
    
    

