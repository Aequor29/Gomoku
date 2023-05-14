//
//  CellView.swift
//  GomokuApp
//
//  Created by 胡浩洋 on 2023/5/12.
//

import SwiftUI

struct CellView: View {
    @ObservedObject var cell: Cell

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.black, lineWidth: 1)
                .frame(width: 22, height: 22)
            Circle()
                .fill(cell.state == 1 ? Color.black : cell.state == 2 ? Color.white : Color.clear)
                .frame(width: 20, height: 20)
        }
        .contentShape(Rectangle())
    }
}


