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
        Text("\(loot.sid) - \(loot.name!) - \(loot.chance * 100)%")
    }
}

struct LootRow_Previews: PreviewProvider {
    static var previews: some View {
        LootRow(loot: LootElem(chance: 0.02, min: 1, max: 1, sid: 10000, name: "Test Loot"))
    }
}
