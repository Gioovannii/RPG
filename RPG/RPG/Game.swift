//
//  File.swift
//  RPG
//
//  Created by Jonathan Gaffé on 2019/10/14.
//  Copyright © 2019 Giovanni Gaffé. All rights reserved.
//

import Foundation

/// Game Class
final class Game {
    
    // MARK: - Proprieties
    
    // declaration of instance PlayerFactory
    private let playerFactory = PlayerFactory()
    // declare of array Player to append players
    private var players = [Player]()
    
    // MARK: - Methods
    
    public func principalMenu() {
        // Description of Game and menu to choose
        print("""

    
    -------------------------------------------------------------------------------
                                Fighting Game

         Hey man, you have been catch by the troops of Roma. But we are lucky they
    choice you as our captain. By chance I've already check our possible teams.
    Check this out :
         
        + Warrior with 100 life points and equiped with a Sword of 10 dammage
        + Magus with 60 life points with a Magic stick of 30 healing but unable to attack
        + Colossus with 150 life points with a Spiked Shield of 3 dammage

    You can choice 3 characters maximum until someone have all his characters dead
   To have a good start we gave to all characters a magic drink of 20 life points.

    Maybe you get a chance to find a new Weapon who knows ...

            Good luck to you

    ---------------------------------------------------------------------------------

      1. New Game
      2. Quit
       
""")
        
        // if player choice 1 or 2
        if let line = readLine() {
            switch line {
            case "1": // we switch to the creation of fighters
                // call of the method createPlayers
                playerFactory.createPlayers()
                // adjust for the players to the players in playerFactory class
                players = playerFactory.players
                fight()
            case "2":
                print("You quit")
            default: // if not
                print("You must choice 1 or 2 🤣 ")
                // back to choice menu
                principalMenu()
            }
        }
    }
    
}
