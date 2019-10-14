//
//  Characters.swift
//  RPG
//
//  Created by Jonathan Gaffé on 2019/10/14.
//  Copyright © 2019 Giovanni Gaffé. All rights reserved.
//

import Foundation

enum CharacterType: String {
    case Warrior, Magus, Colossus
}

class Character {
    
    // MARK: - Proprieties
    
    // Name of our characters
    let name: String
    // Type via enumeration
    let type: CharacterType
    // Weapons using Weapon class
    var weapon: Weapon
    // Maximum Life
    let maxLife: Int
    // Life of our Characters
    var lifePoints: Int {
        // Observer before any action is finish
        willSet {
            if newValue > lifePoints && newValue > 0  {
                print("You're character is healing ... ")
            } else if newValue < lifePoints && newValue > 0 {
                print("You're character is attacking ... ")
            } else {
                print("Oh my god You receive a furious attack")
            }
        }
        // Observer after life change
        didSet {
            if oldValue > lifePoints && oldValue > 0 {
                print("\(self.name) lose \(oldValue - lifePoints) of life points")
            } else if oldValue < lifePoints && oldValue > 0 {
                print("\(self.name) gain \(lifePoints - oldValue) of life points")
            } else {
                print("You're dead on the battle 💩 ")
            }
        }
    }
    
    // Character is still alive
    var isDead: Bool {
        return lifePoints <= 0
    }
    
    // MARK: - Methods
    
    init(name: String, type: CharacterType, lifePoints: Int, maxLife: Int, weapon: Weapon) {
        self.name = name
        self.type = type
        self.lifePoints = lifePoints
        self.maxLife = maxLife
        self.weapon  = weapon
    }
}
