//
//  WelcomeRouter.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/9/21.
//

import Foundation


enum WelcomeRouter : RouterProtocol {
    private static let baseurl = Constants.baseURL
    
    case getDatFromWelcome
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
       return WelcomeRouter.baseurl
    }
    
    var path: String {
        switch self {
        case .getDatFromWelcome:
            return "/date/\(DateService.shared.getCurrentMonth())/17"
        }
    }
    
    var headers: [HTTPHeader] {
      switch self {
      default:
        return []
      }
    }

    var parameters: [String: Any] {
      switch self {
      default:
        return [:]
      }
    }

    var parameterEncoding: ParameterEncoding {
      switch self {
      default:
        return .url
      }
    }

    var method: HTTPMethod {
      switch self {
      case .getDatFromWelcome:
        return .get
      }
    }
}
