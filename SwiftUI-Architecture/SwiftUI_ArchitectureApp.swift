//
//  SwiftUI_ArchitectureApp.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 17/05/21.
//

import SwiftUI

@main
struct SwiftUI_ArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView()
            .environment(\.font, Font.Typography.sizingFont(font: .main, size: .title))
        }
    }
}

struct SwiftUI_ArchitectureApp_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environment(\.font, Font.Typography.sizingFont(font: .main, size: .title))
      .environment(\.colorScheme, .dark)
  }
}
