//
//  BossRow.swift
//  gridhero_wiki
//
//  Created by Björn Roßborsky-Stoß on 30.08.21.
//  Copyright © 2021 bjurner. All rights reserved.
//

import SwiftUI

struct BossRow: View {
    var monster: Monster
    var body: some View {
        HStack {
            Text("Lv. \(monster.lvl)")
        Text(monster.name)
            
        }
        .foregroundColor(bossColor())
    }
    
    // currently the onliest identier for me to know if its
    // normal, hard or hell is the id. under 10k is normal
    // under 20k is hard, under 30k is hell
    func bossColor() -> Color {
        if monster.id < 10_000 {
            return Color(.systemGray)
        }
        if monster.id < 20_000 {
            return Color(.systemRed)
        }
        
        return Color(.systemYellow)
    }
}

struct BossRow_Previews: PreviewProvider {
    static var previews: some View {
        BossRow(monster: Monster(id: 7009, name: "My Monster", isBoss: 1, isHuman: 0, lvl: 99, rewardid: 8904, qty: 5))
    }
}
