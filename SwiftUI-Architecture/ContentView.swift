//
//  ContentView.swift
//  SwiftUI-Architecture
//
//  Created by Mohd Maruf on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      Text("Hello, world!").foregroundColor(Color.Token.inactive)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
        .environment(\.font, Font.Typography.subFont)
        .environment(\.colorScheme, .light)
    }
}
