//
//  BossDetailViewModel.swift
//  gridhero_wiki
//
//  Created by bjurner on 29.08.21.
//

import Foundation

class MonsterDetailViewModel: ObservableObject {
    
    let monster: Monster
    
    var lootData: Loot?
    var loot: [LootElem] = []
    var loot2: [LootElem] = []
    init(monster: Monster) {
        self.monster = monster
        if let lootData = Global.shared.lootData.gdLoots[monster.rewardid!] {
            
            loot = lootData.allNamedDrops()
            loot2 = lootData.expandableElems()
        }
    }
    
    func rawList () -> [LootElem] {
        return loot2
    }
    
    func filteredLootList(searchText: String, raritiy: Int) -> [LootElem] {
        return loot
            .filter({searchText.isEmpty ? true : $0.name!.contains(searchText)})
            .filter({
                switch raritiy {
                case 0:
                    return $0.sid < 720_000
                case 1:
                    return $0.sid >= 720_000 && $0.sid < 730_000
                case 2:
                    return $0.sid >= 730_000 && $0.sid < 740_000
                case 3:
                    return $0.sid >= 740_000 && $0.sid < 750_000
                case 4:
                    return $0.sid >= 750_000 && $0.sid < 760_000
                case 5:
                    return $0.sid >= 760_000
                default:
                    return true
                }
            })
    }
}
