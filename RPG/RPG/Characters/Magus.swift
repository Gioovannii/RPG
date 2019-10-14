//
//  Magus.swift
//  RPG
//
//  Created by Jonathan Gaffé on 2019/10/14.
//  Copyright © 2019 Giovanni Gaffé. All rights reserved.
//

import Foundation

final class Magus: Character {
init(name: String) {
    super.init(name: name, type: .Magus, lifePoints: 60, maxLife: 80, weapon: MagusStick())
}

/// Description change for the magus
override func description(index: Int) -> String {
    // If is dead nothing change
    if self.isDead {
        return super.description(index: index + 1)
        // Change to show the healing
    } else {
        return "\(index). \(name) \(type) with \(lifePoints)/\(maxLife) life points, is healing with a \(weapon.weaponName) by \(weapon.healing)"
    }
}
