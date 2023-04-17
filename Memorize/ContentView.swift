//
//  ContentView.swift
//  Memorize
//
//  Created by Laguna.rkz on 29/03/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
        
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.chooseCard(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
        
    }
    
    struct CardView: View {
        var card: MemoryGame<String>.Card
        
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                    
                    if card.isFaceUp {
                        shape.fill().foregroundColor(.white)
                        shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                        Text(card.content).font(font(geometry?.size))
                    } else if card.isMatched {
                        shape.opacity(0)
                    } else {
                        shape.fill()
                    }
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}
