//
//  Global.swift
//  gridhero_wiki
//
//  Created by bjurner on 29.08.21.
//

import Foundation

public struct Global {
    public static var shared = Global()

    public lazy var monsterData: MonsterData = {
        let datafileUrl =
                Bundle.main.path(forResource: "monster_data", ofType: "json")!
        let data = FileManager.default.contents(atPath: datafileUrl)!
        let decoder = JSONDecoder()
        return try! decoder.decode(MonsterData.self, from: data)
    }()
    public var lootData: LootData = {
        let datafileUrl =
                Bundle.main.path(forResource: "loot_data", ofType: "json")!
        let data = FileManager.default.contents(atPath: datafileUrl)!
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(LootData.self, from: data)
        } catch {
            print(error)
            fatalError()
        }
    }()
}

public enum Rarity: Int {
    case common = 1
    case uncommon = 2
    case rare = 3
    case epic = 4
    case unique = 5
}
