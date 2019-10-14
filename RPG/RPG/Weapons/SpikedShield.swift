//
//  SpikedShield.swift
//  RPG
//
//  Created by Jonathan Gaffé on 2019/10/14.
//  Copyright © 2019 Giovanni Gaffé. All rights reserved.
//

import Foundation

/// Basic weapon
final class SpikedShield: Weapon {
    init() {
        super.init(damage: 3, WeaponName:"SpikedShield", healing: 0)
    }
}
