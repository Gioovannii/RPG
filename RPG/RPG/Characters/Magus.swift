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
/// Lock the attack to print message
    override func attack(_ target: Character) {
        print("Sorry I can't attack")
    }
    
    /// Heal a character
    internal func heal(_ target: Character) {
        // Over heal not accepted
        // As long the target have the same amount of life than you want to heal
        // We only print Life is full
        guard target.lifePoints != target.maxLife else {
            print("You're fighter is already full of life")
            return
        }
        // New variable to calculate new life points
        var newLifePoints = target.lifePoints + self.weapon.healing
        
        // Not over heal
        if newLifePoints >= target.maxLife {
            newLifePoints = target.maxLife
        }
        // Guard statement didn't block so we can add some life
        target.lifePoints = newLifePoints
    }
}
