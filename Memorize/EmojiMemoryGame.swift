//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Laguna on 31/03/23.
//

import SwiftUI

class EmojiMemoryGame {
    
    static let emojis: [String] = [
        "🏎","🚀", "🚒", "🚑", "🛸", "✈️", "🚁", "🚜", "🚔", "🛶",
        "🚗", "🚛", "🛵", "🚂", "🚌", "🛴", "🚲", "🚤", "🚚", "🏍"
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairs: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
 
    private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
