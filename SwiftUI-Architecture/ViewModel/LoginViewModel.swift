//
//  LoginViewModel.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 18/05/21.
//

import SwiftUI
import Combine

class LoginViewModel:ObservableObject {

  @Published var username = ""
  @Published var password = ""

  @Published var user:User!

  private var cancellable:AnyCancellable?
  private var networkManager:NetworkManager

  init(networkManager:NetworkManager) {
    self.networkManager = networkManager
  }

  func loginUser() {
    cancellable =  self.networkManager.loginPublisher(username: username, password: password)
      .sink { value in
        switch value {
        case .failure(let error):
          print(error.localizedDescription)
        case .finished:
          break
        }
      } receiveValue: { (user) in
        self.user = user
      }
  }

}
