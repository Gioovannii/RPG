//
//  File.swift
//  RPG
//
//  Created by Jonathan Gaffé on 2019/10/14.
//  Copyright © 2019 Giovanni Gaffé. All rights reserved.
//

import Foundation
/// Define each of our player
final class Player {
    
    // MARK: - Proprieties
    
    let name: String
    var characters = [Character]()
    // calculate propriety to check dead Characters
    var isLoser: Bool {
        var isLoser = false
        for character in characters {
            if character.isDead {
                isLoser = true
            } else { return false }
        }
        return isLoser
    }
    
    // MARK: - Methods
    
    init(name: String) {
        self.name = name
    }
    
    //func for display your player for the fight
    public func descriptionCharacters() {
        // Start the loop in the charactersTeams using (key, value)
        for (index, character) in characters.enumerated() {
            print(character.description(index: index + 1))
        }
    }
}
