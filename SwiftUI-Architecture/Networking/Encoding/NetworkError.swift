//
//  NetworkError.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 18/05/21.
//

import Foundation

public enum NetworkError:String,Error {

  case parametersNil  = "Parameters were nil"
  case encodingFailed = "Unable to encode parameters"
  case missingURL     = "Unable to find URL"
  case downloadFailed = "Unable to download"
  case decodingFailed = "Unable to decode data"
  case buildRequestFailed  = "Unable to build request"
}
