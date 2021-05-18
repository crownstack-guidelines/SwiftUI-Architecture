//
//  NewsApi.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 18/05/21.
//

import Foundation

enum NewsApi {
  case bussiness(country:String)
}

extension NewsApi:EndPointType {
  var baseUrl: URL {
    return URL(string: NetworkManager.environment.getBaseUrl())!
  }

  var path: String {
    return "/movies"
  }

  var httpMethod: HTTPMethod {
    switch self {
    case .bussiness:
      return .get
    }
  }

  var httpTask: HTTPTask {
    switch self {
    case .bussiness(let country):
      return .requestParameters(bodyParameters: nil, urlParameters: ["country":country])
    }
  }

}
