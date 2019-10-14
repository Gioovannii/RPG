//
//  Sword.swift
//  RPG
//
//  Created by Jonathan Gaffé on 2019/10/14.
//  Copyright © 2019 Giovanni Gaffé. All rights reserved.
//

import Foundation

/// Basic weapon
final class Sword: Weapon {
    init() {
        super.init(damage: 10, WeaponName:"Sword", healing: 0)
    }
}
