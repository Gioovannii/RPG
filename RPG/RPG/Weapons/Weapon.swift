//
//  Weapon.swift
//  RPG
//
//  Created by Jonathan Gaffé on 2019/10/14.
//  Copyright © 2019 Giovanni Gaffé. All rights reserved.
//

import Foundation

class Weapon {
    let damage: Int
    let weaponName: String
    let healing: Int
    
    init(damage: Int, WeaponName: String, healing: Int) {
        self.damage = damage
        self.weaponName = WeaponName
        self.healing = healing
    }
}
