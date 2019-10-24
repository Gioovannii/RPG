//
//  Game.swift
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
    // Keep in memory all turns
    private var numberOfTurns = 1
    
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
                endGame()
            case "2":
                print("You quit")
            default: // if not
                print("You must choice 1 or 2 🤣 ")
                // back to choice menu
                principalMenu()
            }
        }
    }
    
    /// fight continue until there is a loser
    private func fight() {
        while true {
            // for loop to take a player at index 0 and play his turn
            for i in 0..<2 {
                print("")
                print(players[i].name + " choose your character")
                players[i].descriptionCharacters()
                print("")
                let chosenCharacter = players[i].characters[userChoice() - 1]
                print("")
                misteryBox(chosenCharacter)
                if let magus = chosenCharacter as? Magus {
                    print("choose a character to heal")
                    players[i].descriptionCharacters()
                    magus.heal(players[i].characters[userChoice() - 1])
                    // index is at 0 so we ca
                } else {
                    if i == 0 {
                        let target = players[i + 1]
                        print("")
                        fightDetails(target: target, character: chosenCharacter, index: i)
                        if players[i + 1].isLoser {
                            return
                        }
                    } else {
                        let target = players[i - 1]
                        fightDetails(target: target, character: chosenCharacter, index: i)
                        if players[i - 1].isLoser {
                            return
                        }
                    }
                }
            }
            numberOfTurns += 1
        }
    }
    
    /// Action every time player need to choice a character of each team
    private func fightDetails(target: Player, character: Character, index : Int) {
        target.descriptionCharacters() //Desciprion of ennemy
        print("choose a character to attack !")
        let myTarget = target.characters[userChoice() - 1]
        // create of optional to remove one character in the userChoice
        character.attack(myTarget) // attack
    }
    
    /// function to ask choice to user every time needed
    private func userChoice() -> Int {
        var userChoice = 0
        repeat {
            if let data = readLine() {
                if let integer = Int(data) {
                    userChoice = integer
                }
            }
        } while userChoice != 1 && userChoice != 2 && userChoice != 3
        return userChoice
    }
    
    /// function contain a bonus
    private func misteryBox(_ character: Character) {
        let randomNumber = Int.random(in: 1...99)
        if character.lifePoints >= 1, randomNumber <= 40 {
            print("The magic chest just appear ")
            if character is Magus {
                print("Congratulation ! You found the AngelStick with 70 of healing let's use this right now ")
                print("")
                let newWeapon = AngelStick()
                character.weapon = newWeapon
            } else {
                print("Congratulation! You found the Cross Bow with 70 of dammage so powerfull ")
                print("")
                let newWeapon = CrossBow()
                character.weapon = newWeapon
            }
        }
    }
    
    private func endGame() {
        for player in players {
            print("player : " + player.name)
            player.descriptionCharacters()
            print("")
        }
        for player in players {
            if player.isLoser {
                print("\(player.name) lose ")
            }
        }
        print("with a total of \(numberOfTurns) turns ")
    }
}



