//
//  Item.swift
//  gridhero_wiki
//
//  Created by Björn Roßborsky-Stoß on 30.08.21.
//  Copyright © 2021 bjurner. All rights reserved.
//

import Foundation

public struct ItemData: Codable {
    public var gdItems: [String: Item]
}

public struct Item: Codable {
    public var id: Int
    public var name: String
    
}
