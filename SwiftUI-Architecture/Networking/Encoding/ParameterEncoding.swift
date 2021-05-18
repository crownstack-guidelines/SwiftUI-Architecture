//
//  ParameterEncoding.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 18/05/21.
//

import Foundation

public typealias Parameters = [String:Any]

protocol ParameterEncoder {
  static func encode(urlRequest: inout URLRequest, with parameters:Parameters) throws
}
