//
//  NetworkManager.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 18/05/21.
//

import Foundation
import Combine

enum Environment:String {
    case production = "production"
    case qa         = "qa"
    case staging    = "staging"

  func getBaseUrl() -> String {
    switch self {
    case .production:
      return "https://api.production.example.com"
    case .qa:
      return "https://api.qa.example.com"
    case .staging:
      return "https://api.staging.example.com"
    }
  }
  
}

struct NetworkManager {

  static let environment:Environment = .staging

  private var newsRouter = Router<NewsApi>()
  private var loginRouter = Router<LoginApi>()

  mutating func loginPublisher(username:String,password:String) -> AnyPublisher<User,Error> {
    loginRouter.request(.login(username: username, password: password))
  }

  mutating func getBussinessNewsPublisher<T:Decodable>(of country:String) -> AnyPublisher<T,Error> {
    newsRouter.request(.bussiness(country: country))
  }

}
