//
//  ContentView.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      VStack {
        Text("Swift UI")
          .foregroundColor(Color.Token.buttonHighlight)
          .padding()
        Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift")
        Spacer()
      }.frame(maxWidth:.infinity)
      .background(Color.Token.backgroundTheme)
      .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
        .environment(\.font, Font.Typography.subFont)
        .environment(\.colorScheme, .light)
    }
}
