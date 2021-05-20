//
//  HTTPTask.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 18/05/21.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
  case request

  case requestParameters(bodyParameters:Parameters?,
                         urlParameters:Parameters?)

  case requestParametersAndHeaders(bodyParameters:Parameters?,
                                   urlParameters:Parameters?,
                                   additionalHeaders:HTTPHeaders?)
}
