//
//  Colossus.swift
//  RPG
//
//  Created by Jonathan Gaffé on 2019/10/14.
//  Copyright © 2019 Giovanni Gaffé. All rights reserved.
//

import Foundation

final class Colossus: Character {
    init(name: String) {
        super.init(name: name, type: .Colossus, lifePoints: 150, maxLife: 170, weapon: SpikedShield())
    }
}
