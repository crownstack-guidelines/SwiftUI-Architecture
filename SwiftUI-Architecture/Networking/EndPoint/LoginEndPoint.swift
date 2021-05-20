//
//  LoginApi.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 18/05/21.
//

import Foundation

/// Below are for examples you can change it based on your API Endpoint
enum LoginEndPoint {
  case login(username:String,password:String)
}

extension LoginEndPoint:EndPointType {
  var baseUrl: URL {
    URL(string: NetworkManager.environment.getBaseUrl())!
  }
  
  var path: String {
    "/login"
  }
  
  var httpMethod: HTTPMethod {
    .post
  }
  
  var httpTask: HTTPTask {
    switch self {
    case .login(let username, let password):
      let params = ["username":username,"password":password]
      return .requestParametersAndHeaders(bodyParameters:params, urlParameters: nil, additionalHeaders: nil)
    }

  }
  

}
