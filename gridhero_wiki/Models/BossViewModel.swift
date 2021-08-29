//
//  BossViewModel.swift
//  gridhero_wiki
//
//  Created by bjurner on 29.08.21.
//

import SwiftUI

class BossViewModel: ObservableObject {
    
    var bosses: [Monster] = []
        
    init() {
        loadData()
    }
    
    func loadData() {
        bosses = Global.shared.monsterData.bosses
    }
    
    func filteredBossList(searchText: String, difficulty: Int) -> [Monster] {
        
        return bosses
            .filter({searchText.isEmpty ? true : $0.name.contains(searchText)})
            .filter({
                switch difficulty {
                case 0:
                    return $0.id < 10_000
                case 1:
                    return $0.id >= 10_000 && $0.id < 20_000
                case 2:
                    return $0.id >= 20_000
                default:
                    return true
                }
            })
    }

}
