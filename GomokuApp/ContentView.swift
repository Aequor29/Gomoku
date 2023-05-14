//
//  ContentView.swift
//  GoGameApp
//
//  Created by 胡浩洋 on 2023/5/12.
//
import SwiftUI

struct ContentView: View {
    @State private var isGameActive = false
    @ObservedObject var game = Game()

    var body: some View {
        if isGameActive {
            VStack {
                ForEach(0..<15, id: \.self) { i in
                    HStack {
                        ForEach(0..<15, id: \.self) { j in
                            CellView(cell: self.game.grid[self.game.index(x: j, y: i)])
                                .onTapGesture {
                                    if self.game.winner == nil {
                                        self.game.playTurn(x: j, y: i)
                                    }
                                }
                        }
                    }
                }
                if let winner = game.winner {
                    if winner == 1{
                        Text("Black wins!")
                            .font(.largeTitle)
                            .padding()
                    }
                    else {
                        Text("White wins!")
                            .font(.largeTitle)
                            .padding()
                    }
                }
                    
                Button(action: {
                    self.game.reset()
                }) {
                    Text("Restart")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }.padding()
            .background(Color.gray)
        } else {
            StartMenuView(isGameActive: $isGameActive)
        }
    }
}
