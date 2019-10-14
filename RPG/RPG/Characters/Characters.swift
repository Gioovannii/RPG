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
/// Description of characters lifes
   func description(index: Int) -> String {
       if isDead {
           return("Your \(name) the \(type) is unable to be chosen, he had die during the fight. ☠️")
       } else {
           return("\(index). \(name) the \(type) \(lifePoints)/\(maxLife) life points /  \(weapon.weaponName) : \(weapon.damage) dammage ")
       }
   }
   
   /// Deduction of target's life points
   func attack(_ target: Character) {
       // Deduct weapon's damage to the target's life points
       let newLifePoint = target.lifePoints - self.weapon.damage
       
       if lifePoints > 0 { // Check of character's life before checking isDead
           if target.isDead {
               print("You can't attack dead people")
           } else {
               target.lifePoints = newLifePoint
               if target.lifePoints < 0  {
                   target.lifePoints = 0
               }
           }
       } else {
           print("You're character is already dead my friend ")
       }
   }
