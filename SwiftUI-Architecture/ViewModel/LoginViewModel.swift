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
  @Published var isDisconnected:Bool = false

  @Published var user:User!

  private var cancellable:AnyCancellable?
  private var networkManager:Networkable


  init(networkManager:Networkable) {
    self.networkManager = networkManager
    loginUser()
  }

  deinit {
    cancellable?.cancel()
  }

  func loginUser() {
      if NetworkManager.isConnected() {
        isDisconnected = false
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
      }else{
        isDisconnected = true
      }
  }
}
