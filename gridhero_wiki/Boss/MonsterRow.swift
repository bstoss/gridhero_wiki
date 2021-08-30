//
//  BossRow.swift
//  gridhero_wiki
//
//  Created by bjurner on 29.08.21.
//

import SwiftUI

struct MonsterRow: View {
    var monster: Monster
    var body: some View {
        HStack {
            Text("Lv. \(monster.lvl)")
        Text(monster.name)
            
        }
        .foregroundColor(color())
    }
    
    // currently the onliest identier for me to know if its
    // normal, hard or hell is the id. under 10k is normal
    // under 20k is hard, under 30k is hell
    func color() -> Color {
        
        switch monster.qty {
        case 1:
            return Color(.systemGray)
        case 2:
            return Color(.systemGreen)
        case 3:
            return Color(.systemBlue)
        case 4:
            return Color(.systemPurple)
        case 5:
            return Color(.systemRed)
        default:
            return .black
        }
        
    }
}

struct MonsterRow_Previews: PreviewProvider {
    static var previews: some View {
        MonsterRow(monster: Monster(id: 7009, name: "My Monster", isBoss: 1, isHuman: 0, lvl: 99, rewardid: 8904, qty: 5))
    }
}
