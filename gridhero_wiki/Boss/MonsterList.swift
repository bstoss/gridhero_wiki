//
//  MonsterList.swift
//  gridhero_wiki
//
//  Created by Björn Roßborsky-Stoß on 30.08.21.
//  Copyright © 2021 bjurner. All rights reserved.
//

import SwiftUI

struct MonsterList: View {
    @EnvironmentObject var monsterListViewModel: MonsterListViewModel
    
    @State private var searchText: String = ""
    @State private var difficulty = -1
    @State private var rarity = -1

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
                
                Picker(selection: $rarity, label: Text("")) {
                    Text("Common").tag(0)
                    Text("Uncommon").tag(1)
                    Text("Rare").tag(2)
                    Text("Epic").tag(3)
                    Text("Unique").tag(4)
                    Text("Legendary").tag(5)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(7)
                
                List(monsterListViewModel.filteredMonsterList(searchText: searchText, difficulty: difficulty)) { monster in
                    
                    NavigationLink(destination: MonsterDetail(monsterDetailViewModel: MonsterDetailViewModel(monster: monster))) {
                        MonsterRow(monster: monster)
                    }
                }
                .navigationTitle("Bosses")
            }
        }
    }
}

struct MonsterList_Previews: PreviewProvider {
    static var previews: some View {
        MonsterList()
    }
}
