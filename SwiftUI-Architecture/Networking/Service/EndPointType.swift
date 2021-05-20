//
//  EndPointType.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 18/05/21.
//

import Foundation

protocol EndPointType {
  var baseUrl:URL {get}
  var path:String {get}
  var httpMethod:HTTPMethod {get}
  var httpTask:HTTPTask {get}
}
