//
//  ContentView.swift
//  AnimalShogi
//
//  Created by TAIGA ITO on 2024/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var game = Game()
    
    var body: some View {
        VStack(spacing: 2) {
            ForEach(0..<4, id: \.self) { row in
                HStack(spacing: 2) {
                    ForEach(0..<3, id: \.self) { col in
                        
                        CellView(piece: game.gameBoard.board[row][col])
                            .onTapGesture {
                                let position = Position(row: row, col: col)
                                // 駒の移動処理
                                if let selected = game.selectedPiecePosition {
                                    print("move", selected, position)
                                    _ = game.movePiece(to: position)
                                } else {
                                    print("select", position)
                                    game.selectPiece(at: position)
                                }
//                                game.movePiece(to: position)
                            }
                    }
                }
            }
        }
    }
}

struct CellView: View {
    let piece: Piece?
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 80, height: 80)
            
            if let piece = piece {
                Text(pieceDisplay(piece: piece))
                    .font(.largeTitle)
            }
        }
    }
    
    func pieceDisplay(piece: Piece) -> String {
        switch piece.type {
        case .lion: return "🦁"
        case .elephant: return "🐘"
        case .giraffe: return "🦒"
        case .chick: return "🐥"
        case .hen: return "🐓"
        }
    }
}

#Preview {
    ContentView()
}
