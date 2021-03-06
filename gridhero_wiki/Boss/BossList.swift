//
//  BossList.swift
//  gridhero_wiki
//
//  Created by bjurner on 29.08.21.
//

import SwiftUI

struct BossList: View {
    
    @EnvironmentObject var monsterListViewModel: MonsterListViewModel
    
    @State private var searchText: String = ""
    @State private var difficulty = -1
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                
                Picker(selection: $difficulty, label: Text("")) {
                    Text("Normal").tag(0)
                    Text("Hard").tag(1)
                    Text("Hell").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(7)
                
                List(monsterListViewModel.filteredBossList(searchText: searchText, difficulty: difficulty)) { monster in
                    
                    NavigationLink(destination: MonsterDetail(monsterDetailViewModel: MonsterDetailViewModel(monster: monster))) {
                        BossRow(monster: monster)
                    }
                }
                .navigationTitle("Bosses")
                
            }
        }
    }
}

struct BossList_Previews: PreviewProvider {
    static var previews: some View {
        BossList()
    }
}
