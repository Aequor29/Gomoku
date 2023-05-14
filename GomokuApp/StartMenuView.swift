//
//  StartMenuView.swift
//  GoGameApp
//
//  Created by 胡浩洋 on 2023/5/13.
//

import SwiftUI

struct StartMenuView: View {
    @Binding var isGameActive: Bool

    var body: some View {
        VStack {
            Text("Gomoku")
                .font(.largeTitle)
                .padding()
            Button(action: {
                self.isGameActive = true
            }) {
                Text("Start Game")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
