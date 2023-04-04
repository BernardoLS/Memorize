//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Laguna on 29/03/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup<ContentView> {
            ContentView(viewModel: game)
        }
    }
}
