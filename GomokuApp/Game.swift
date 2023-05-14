//
//  Game.swift
//  GomokuApp
//
//  Created by 胡浩洋 on 2023/5/12.
//

import SwiftUI
import Combine

class Game: ObservableObject {
    @Published var grid: [Cell] = []
    @Published var turn: Int = 1
    @Published var winner: Int? = nil
    
    
    init() {
        for _ in 0..<15*15 {
            grid.append(Cell())
        }
    }

    func index(x: Int, y: Int) -> Int {
        return y * 15 + x
    }

    func playTurn(x: Int, y: Int) {
        let idx = index(x: x, y: y)
        if grid[idx].state == 0 {
            grid[idx].state = turn
            if checkWin(player: turn, x: x, y: y){
                winner = turn
            } else{
                turn = turn == 1 ? 2 : 1
            }
        }
    }
    
    func reset() {
        for cell in grid {
            cell.state = 0
        }
        turn = 1
        winner = nil
    }
    
    func checkWin(player: Int, x: Int, y: Int) -> Bool {
        let directions = [(0,1),(1,0),(1,1),(1,-1)]
        for (dx,dy) in directions {
            var count = 0
            for dir in [-1, 1] {
                var nx = x + dir * dx
                var ny = y + dir * dy
                while nx >= 0 && nx < 15 && ny >= 0 && ny < 15 && grid[index(x: nx, y: ny)].state == player {
                    count += 1
                    nx += dir * dx
                    ny += dir * dy
                }
            }
            if count >= 4 {
                return true
            }
        }
        return false
    }
    
}



class Cell: ObservableObject {
    @Published var state: Int = 0
}


