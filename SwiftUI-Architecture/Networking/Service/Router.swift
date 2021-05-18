//
//  Router.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 18/05/21.
//

import Foundation
import Combine

//typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter {
    associatedtype EndPoint:EndPointType
  mutating func request<T>(_ route:EndPoint) ->AnyPublisher<T,Error> where T:Decodable
}

struct Router<EndPoint:EndPointType>: NetworkRouter {
  private var task:URLSession.DataTaskPublisher?

  mutating func request<T>(_ route: EndPoint) -> AnyPublisher<T,Error> where T:Decodable {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
          return session.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        }catch {
          return Fail(error: error).eraseToAnyPublisher()
        }
    }


    fileprivate func buildRequest(from route:EndPointType) throws -> URLRequest {

        var request = URLRequest(url: route.baseUrl.appendingPathComponent(route.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)

        request.httpMethod = route.httpMethod.rawValue

        do {
            switch route.httpTask {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            case .requestParameters(let bodyParameters, let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)

            case .requestParametersAndHeaders(let bodyParameters, let urlParameters, let additionalHeaders):
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            }
            return request
        }catch {
            throw error
        }

    }

    fileprivate func configureParameters(bodyParameters:Parameters?,
                                         urlParameters:Parameters?,
                                         request:inout URLRequest)throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        }
        catch {
            throw error
        }
    }

    fileprivate func addAdditionalHeaders(_ additionalHeaders:HTTPHeaders?, request:inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key,value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }

}
