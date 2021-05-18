//
//  LoginApi.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 18/05/21.
//

import Foundation

enum LoginApi {
  case login(username:String,password:String)
}

extension LoginApi:EndPointType {
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
      return .requestParametersAndHeaders(bodyParameters: ["username":username,"password":password], urlParameters: nil, additionalHeaders: nil)
    }

  }
  

}
