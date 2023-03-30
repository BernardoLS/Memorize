//
//  ContentView.swift
//  Memorize
//
//  Created by Laguna.rkz on 29/03/23.
//

import SwiftUI

struct ContentView: View {
    
    struct CardContent: Identifiable {
        var id: String
        var content: String
    }
    
    let cardContents: [CardContent] =
    [
        CardContent(id:"01", content: "🏎"),
        CardContent(id:"02", content: "🚀"),
        CardContent(id:"03", content: "🏎"),
        CardContent(id:"04", content: "🚀"),
        
    ]
    
    @State var emojisCount = 3
    
    let emojis: [String] = [
        "🏎","🚀", "🚒", "🚑", "🛸", "✈️", "🚁", "🚜", "🚔", "🛶",
        "🚗", "🚛", "🛵", "🚂", "🚌", "🛴", "🚲", "🚤", "🚚", "🏍"
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojisCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                removeButton
                Spacer()
                addButton
            }.font(.largeTitle)
            .padding(.horizontal)
        }
        .foregroundColor(.red)
        .padding(.horizontal)
        
    }
    var removeButton: some View {
        Button(
            action: {
                if emojisCount > 1 {
                    emojisCount -= 1
                }
            },
            label: { Image(systemName: "minus.circle") }
        )
    }
    
    var addButton: some View {
        Button(action: {
            if emojisCount < emojis.count {
                emojisCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
    struct CardView: View {
        var content: String
        @State var isFaceUp = false
        
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                
                if isFaceUp {
                    shape.foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                } else {
                    shape
                }
                
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
