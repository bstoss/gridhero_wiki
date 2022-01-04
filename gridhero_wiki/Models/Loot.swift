//
//  Loot.swift
//  gridhero_wiki
//
//  Created by bjurner on 29.08.21.
//

import Foundation

public struct LootData: Codable {
    public var gdLoots: [Int: Loot]
}

public struct Loot: Codable, Identifiable {
    public var id: Int
    public var elems: [Int: LootElem]
    
    public func expandableElems(chance: Float? = nil) -> [LootElem] {
        var allNamedDrops: [LootElem] = []
        
        for elem in elems {
            var drop = elem.value
//            if let chance = chance {
//                //drop.chance *= chance
//            }
            
            guard let loot = Global.shared.lootData.gdLoots[drop.sid] else {
                print("Loot Item missing: \(drop.sid)")
                allNamedDrops.append(drop)
                continue
            }
            drop.childs = []
            
            for namedDrop in loot.expandableElems(chance: drop.chance) {
                drop.childs?.append(namedDrop)
//                allNamedDrops.append(namedDrop)
            }
            
            allNamedDrops.append(drop)
        }
        return allNamedDrops.sorted { left, right in
            if left.name != right.name {
                return left.name! < right.name!
            }
            
            return left.sid < right.sid
        }
    }
    
    public func allNamedDrops(chance: Float? = nil) -> [LootElem] {
        var allNamedDrops: [LootElem] = []
        
        for elem in elems {
            var drop = elem.value
            if let chance = chance {
                drop.chance *= chance
            }
            if drop.name != nil {
                allNamedDrops.append(drop)
            } else {
                guard let loot = Global.shared.lootData.gdLoots[drop.sid] else {
                    print("Loot Item missing: \(drop.sid)")
                    continue
                }
                for namedDrop in loot.allNamedDrops(chance: drop.chance) {
//                    var drop = namedDrop
//                    drop.chance *= elem.value.chance
                    allNamedDrops.append(namedDrop)
                }
            }
        }
        
        return allNamedDrops.sorted { left, right in
            
            if left.name != right.name {
                return left.name! < right.name!
            }
            
            return left.sid < right.sid
        }
    }
}

public struct LootElem: Codable, Identifiable {
    
    
    public var id: Int {
        return sid
    }
    public var chance: Float
    public var min: Int
    public var max: Int
    public var sid: Int // either other loot  or item if name is set
    public var name: String? // if set, sid can be used to get more data from item database
    
    
    public var childs: [LootElem]?
    
//    public var color: UIColor {
//        if (sid-760_000) > 0 {
//            return .systemYellow
//        }
//
//        if (sid-750_000) > 0 {
//            return .systemRed
//        }
//
//        if (sid-740_000) > 0 {
//            return .systemPurple
//        }
//
//        if (sid-730_000) > 0 {
//            return .systemBlue
//        }
//
//        if (sid-720_000) > 0 {
//            return .systemGreen
//        }
//
//        return .systemGray
//    }
}
