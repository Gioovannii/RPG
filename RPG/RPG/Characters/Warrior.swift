//
//  Warrior.swift
//  RPG
//
//  Created by Jonathan Gaffé on 2019/10/14.
//  Copyright © 2019 Giovanni Gaffé. All rights reserved.
//

import Foundation

final class Warrior: Character {
    
    // Each character should be named
    init(name: String) {
        // use the init of the  mother class (Characters with all is propriety)
        super.init(name: name, type: .Warrior, lifePoints: 100, maxLife: 120, weapon: Sword())
    }
}
