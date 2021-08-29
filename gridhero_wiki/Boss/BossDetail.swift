//
//  BossDetail.swift
//  gridhero_wiki
//
//  Created by bjurner on 29.08.21.
//

import SwiftUI

struct BossDetail: View {
    
    var bossDetailViewModel: BossDetailViewModel
    @State private var searchText: String = ""
    @State private var rarity = -1

    
    var body: some View {
        
            VStack {
                SearchBar(text: $searchText)
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
                
                List(bossDetailViewModel.filteredLootList(searchText: searchText, raritiy: rarity)) { lootElem in
                    LootRow(loot: lootElem)
                        .foregroundColor(rowColor(sid: lootElem.sid))
                }
                .navigationTitle("\(bossDetailViewModel.monster.name) Drops")
                
            }
        
    }
    
    // when loot item really connectedto item_data
    // the property "color" will replace this
    func rowColor(sid: Int) -> Color {
            if sid < 720_000 {
                return Color(.systemGray)
            }
            
            if sid < 730_000 {
                return Color(.systemGreen)
            }
            
            if sid < 740_000 {
                return Color(.systemBlue)
            }
            
            if sid < 750_000 {
                return Color(.systemPurple)
            }
            
            if sid < 760_000 {
                return Color(.systemRed)
            }
            
            return Color(.systemYellow)
        }
}

struct BossDetail_Previews: PreviewProvider {
    static var previews: some View {
        BossDetail(bossDetailViewModel:
                    BossDetailViewModel(monster: Monster(id: 7009, name: "My Monster", isBoss: 1, lvl: 99, rewardid: 8904)))
    }
}
