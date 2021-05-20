//
//  NetworkManager.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 18/05/21.
//

import Foundation
import Combine
import Network

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

protocol Networkable {
  static var environment:Environment {get}
  func loginPublisher(username:String,password:String) -> AnyPublisher<User,NetworkError>
  func getBussinessNewsPublisher<T:Decodable>(of country:String) -> AnyPublisher<T,NetworkError>
  func downloadImagePublisher(highResUrl:URL,lowResUrl:URL) -> AnyPublisher<Data,NetworkError>
}

extension Networkable {
  static var environment:Environment {
    .staging
  }
}


class NetworkManager {

  private var newsRouter = Router<NewsEndPoint>()
  private var loginRouter = Router<LoginEndPoint>()

  static func isConnected() -> Bool {
    do {
      return try Reachability().isConnectedToNetwork
    } catch {
      return false
    }
  }

  deinit {}

}

extension NetworkManager:Networkable {

  func loginPublisher(username:String,password:String) -> AnyPublisher<User,NetworkError> {
    loginRouter.request(.login(username: username, password: password))
  }

  func getBussinessNewsPublisher<T:Decodable>(of country:String) -> AnyPublisher<T,NetworkError> {
    newsRouter.request(.bussiness(country: country))
  }

  func downloadImagePublisher(highResUrl:URL,lowResUrl:URL) -> AnyPublisher<Data,NetworkError>  {
    let session:URLSession = URLSession.shared

    var urlRequest = URLRequest(url: highResUrl, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10.0)
    urlRequest.allowsConstrainedNetworkAccess = false
    return session.dataTaskPublisher(for: urlRequest)
      .tryCatch { (error) -> URLSession.DataTaskPublisher in
        guard error.networkUnavailableReason == .constrained else { throw error }
        return session.dataTaskPublisher(for: lowResUrl)
      }
      .tryMap { data, response -> Data in
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
          throw NetworkError.downloadFailed
        }
        return data
      }
      .mapError({ (error) in
        return NetworkError.downloadFailed
      })
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}




