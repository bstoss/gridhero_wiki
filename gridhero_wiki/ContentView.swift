//
//  ContentView.swift
//  gridhero_wiki
//
//  Created by bjurner on 29.08.21.
//

import SwiftUI

struct ContentView: View {
    
    var monstersViewModel = MonsterListViewModel()
    
    var body: some View {
        TabView {
            BossList()
                .tabItem {
                    Text("Boss")
                }
            MonsterList()
                .tabItem {
                    Text("Monster")
                }
            ItemsList()
                .tabItem {
                    Text("Items")
                }
        }.environmentObject(monstersViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
