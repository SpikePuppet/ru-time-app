//
//  AboutView.swift
//  RuTime
//
//  Created by Rhys Johns on 29/3/2024.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("App by Rhys Johns")
                Text("Artwork by SugarandStories")
                Text("c:")
                NavigationLink(destination: ContentView()) {
                    Text("Back to calculator")
                }
            }
        }
    }
}

#Preview {
    AboutView()
}
