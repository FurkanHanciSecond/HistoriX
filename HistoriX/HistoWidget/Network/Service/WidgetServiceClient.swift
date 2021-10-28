//
//  WidgetServiceClient.swift
//  HistoWidgetExtension
//
//  Created by Furkan Hanci on 10/28/21.
//

import Foundation



import Foundation


final class WidgetService : WidgetServiceDelegate {

    
    func WidgetRequest<K: Codable>(router: RouterProtocol, decodingType: K.Type, completion: @escaping (Result<K, HistoWidgetError>) -> Void) {

      let request: URLRequest

      do {
        request = try router.withURLRequest()
      } catch {
        completion(.failure(error as! HistoWidgetError))
        return
      }

      let session = URLSession(configuration: .default)

      session.dataTask(with: request) { (data, response, testerror) in
        guard testerror == nil else {
          completion(.failure(.genericError))
          return
        }

        guard let response = response as? HTTPURLResponse else {
          completion(.failure(.genericError))
          return
        }

        guard response.statusCode == HTTPStatus.success.rawValue else {
          completion(.failure(.responseError))
          return
        }

        guard let data = data else {
          completion(.failure(.dataError))
          return
        }

        do {
          let decoder = JSONDecoder()
          let model = try decoder.decode(K.self, from: data)
            
            DispatchQueue.main.async {
                completion(.success(model))

            }
        } catch  {
            completion(.failure(.decodingError))
            print(error)
        }
        
      }
      
      .resume()
    }
           


    
    func WidgetRequestWithData(router: RouterProtocol, currentDate: Date, completion: @escaping (Result<Data, HistoWidgetError>) -> Void) {
        
        let request: URLRequest

            do {
                request = try router.withURLRequest()
            } catch {
              completion(.failure(error as! HistoWidgetError))
              return
            }

        
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
                 completion(.failure(.responseError))
                 return
               }

               guard let data = data else {
                 completion(.failure(.dataError))
                 return
               }
            
            completion(.success(data))
        }
        .resume()
        
    }
             
}
