//
//  NetworkError.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 18/05/21.
//

import Foundation

public enum NetworkError:String,Error {

  case parametersNil  = "Parameters were nil"
  case encodingFailed = "Parameter encoding failed"
  case missingURL     = "URL is missing"
}
