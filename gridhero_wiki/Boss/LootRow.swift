//
//  LootRow.swift
//  gridhero_wiki
//
//  Created by bjurner on 29.08.21.
//

import SwiftUI

struct LootRow: View {
    var loot: LootElem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
        if let name = loot.name {
            Text("\(name) - \(loot.chance * 100)% - \(loot.min)/\(loot.max)")
        } else {
            Text("\(loot.sid) - Drop Box - \(loot.chance * 100)% - \(loot.min)/\(loot.max)")
        }
            
            if let chance = chance() {
                Text("\(chance)")
                    .font(.footnote)
            }
            
        }
    }
    
    func chance() -> Float? {
        guard let map = loot.childs?.compactMap({ $0.chance }) else {
            return nil
        }
        return map.reduce(0, +)
    }
}

struct LootRow_Previews: PreviewProvider {
    static var previews: some View {
        LootRow(loot: LootElem(chance: 0.02, min: 1, max: 1, sid: 10000, name: "Test Loot"))
    }
}
