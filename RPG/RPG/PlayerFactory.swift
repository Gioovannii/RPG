//
//  PlayerFactory.swift
//  RPG
//
//  Created by Jonathan Gaffé on 2019/10/14.
//  Copyright © 2019 Giovanni Gaffé. All rights reserved.
//

import Foundation

// Class for create our teams
final class PlayerFactory {
    
    // MARK: - Proprieties
    
    var players = [Player]()
    private let maxPlayers = 2
    private let maxCharacters = 3
    private var characterNames = [String]()
    private var playerNames = [String]()
    
    /// Method createPlayers using createPlayer
    func createPlayers() {
        for i in 0..<maxPlayers {
            print("creation of player nº\(i + 1)")
            guard let player = createPlayer() else { return }
            players.append(player)
        }
    }
    
    /// Create one player using createCharacters
    private func createPlayer() -> Player? {
        let player = Player(name: uniquePlayerName())
        guard  let characters = createCharacters() else  { return nil }
        player.characters = characters
        return player
    }
    
    /// Create the Full team using createCharacter
    private func createCharacters() -> [Character]? {
        var characters = [Character]()
        for i in 0..<maxCharacters {
            print("character nº\(i + 1)")
            guard let character = createCharacter() else {
                print("Choose a number please")
                return nil
            }
            characters.append(character)
        }
        return characters
    }
    
    /// Create of object character depending on choice
    private func createCharacter() -> Character? {
        var userChoice = 0
        print("""
        1. Warrior => 100 Life / Sword: 10 (dammage)
        2. Magus => 60 Life / Stick: 30 (heal)
        3. Colossus => 150 Life / Spiked Shield: 3 (dammage)
        """)
        print("")
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    userChoice = dataToInt
                }
            }
        } while userChoice != 1 && userChoice != 2 && userChoice != 3
        // Switch to create an object of type Character
        switch userChoice {
        case 1:
            return Warrior(name: uniqueCharacterName())
        case 2:
            return Magus(name: uniqueCharacterName())
        case 3:
            return Colossus(name: uniqueCharacterName())
        default:
            print("Choose a number please")
            return nil
        }
    }
    
    /// Method block if characterName allready in use
    private func uniqueCharacterName() -> String {
        print("Enter character name : ")
        var characterName = ""
        repeat {
            if let data = readLine() {
                characterName = data
                if characterNames.contains(characterName) {
                    print("This character name is already taken")
                    characterName = ""
                } else {
                    characterNames.append(characterName)
                }
            }
        } while characterName == ""
        return characterName
    }
    
    /// Method block if playerName allready in use
    private func uniquePlayerName() -> String {
        print("Enter player name : ")
        print("")
        var playerName = ""
        repeat {
            if let data = readLine() {
                playerName = data
                if playerNames.contains(playerName) {
                    print("This player name is already taken")
                    playerName = ""
                } else {
                    playerNames.append(playerName)
                }
            }
        } while playerName == ""
        return playerName
    }
}


