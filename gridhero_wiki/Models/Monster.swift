//
//  Monster.swift
//  gridhero_wiki
//
//  Created by bjurner on 29.08.21.
//

import Foundation


public struct MonsterData: Codable {
   // var gdMonsterSpeak: [String: [String: String]]
    var gdMonsters: [Int: Monster]
    
    public lazy var bosses: [Monster] = {
        gdMonsters.filter({ $0.value.isBoss == 1 && $0.value.rewardid != nil }).map({ $0.value }).sorted { left, right in
            
            if left.lvl != right.lvl {
                return left.lvl < right.lvl
            }
            
            if left.name != right.name {
                return left.name < right.name
            }
            
            return left.id < right.id
                
        }
    }()
    
    public lazy var monsters: [Monster] = {
        gdMonsters.filter({ $0.value.isBoss == 0 && $0.value.isHuman == 0 && $0.value.rewardid != nil }).map({ $0.value }).sorted { left, right in
            
            if left.lvl != right.lvl {
                return left.lvl < right.lvl
            }
            
            if left.name != right.name {
                return left.name < right.name
            }
            
            return left.id < right.id
                
        }
    }()
}


public struct Monster: Codable, Identifiable {

    public var id: Int
    public var name: String
    public var isBoss: Int
    public var isHuman: Int
    public var lvl: Int
    public var rewardid: Int?
    public var qty: Int // the color of the mob at the map
    
   
//    public var color: UIColor {
//        if (id-20_000) > 0 {
//            return .systemYellow
//        }
//        
//        if (id-10_000) > 0 {
//            return .systemRed
//        }
//        
//        return .black
//    }
    
    /*
    var HPAdd: Int
    var HPNum: Int
    var anim: String
    var aselectfail: Int // bool?
    var atkmode: Int
    //var attr: [String: Any?]
    var bssc: Int
    var defaultskill: Int
    var dropnoowner: Int // bool?
    var effHeight: Int
    var effScale: Float
    var exercise: Int
    var exp: Int
    //var head: String // image file
    //var headdrop: String
    var intervalattack: Int
    var intervalmove: Int
    var intervaltrack: Int
    var isBoss: Int
    var isHuman: Int
    
    var modelNameHeight: Int
    var modelScaleX: Float
    var qty: Int
    var searchrange: Int
    var speak: Int
    var otherrewardid: Int?
    
 */
}

