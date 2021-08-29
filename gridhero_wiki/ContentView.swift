//
//  ContentView.swift
//  gridhero_wiki
//
//  Created by bjurner on 29.08.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BossList()
                .tabItem {
                    Label("Boss", systemImage: "list.dash")
                }
            ItemList()
                .tabItem {
                    Label("Items", systemImage: "list.dash")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
