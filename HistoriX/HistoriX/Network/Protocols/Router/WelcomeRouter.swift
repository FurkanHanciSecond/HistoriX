//
//  WelcomeRouter.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/9/21.
//

import Foundation


enum MainModelRouter : RouterProtocol {
    private static let baseurl = Constants.baseURL
    
    case getDatFromWelcome
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
       return MainModelRouter.baseurl
    }
    
    var path: String {
        switch self {
        case .getDatFromWelcome:
            return "/date/\(DateService.shared.getCurrentMonth())/20"
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
